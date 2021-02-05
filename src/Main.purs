module Main where

import Prelude

import Concur.Core (Widget(..))
import Concur.React (HTML)
import Concur.React.Run (runWidgetInDom)
import Content (blogArticles, restful_in_peace, what_i_look_for_in_a_developer)
import Data.Either (either)
import Data.Foldable (find)
import Data.Maybe (fromMaybe, maybe)
import Domain (Article(..))
import Domain (Page(..), PageActions(..)) as Domain
import Effect (Effect)
import Effect.Class (liftEffect)
import Foreign (Foreign, unsafeToForeign)
import Functions (fuzzyFindArticleBySlug)
import Nav (Route(..), currentRoute, parseRoute, printRoute)
import Render (renderPage, withNavbar)
import Routing.PushState (PushStateInterface, makeInterface)

routeToPage :: Route -> Domain.Page
routeToPage BlogSummary = Domain.ListOfArticles blogArticles
routeToPage (BlogArticle slug) =
    let
        found = fuzzyFindArticleBySlug blogArticles slug
    in
    maybe Domain.NotFound Domain.SingleArticle found
routeToPage Résumé = Domain.CV
routeToPage Contact = Domain.Contact
routeToPage NotFound = Domain.NotFound

pageToRoute :: Domain.Page -> Route
pageToRoute (Domain.ListOfArticles _) = BlogSummary
pageToRoute (Domain.SingleArticle (Article a)) = BlogArticle a.slug
pageToRoute (Domain.CV) = Résumé
pageToRoute (Domain.Contact) = Contact
pageToRoute (Domain.NotFound) = NotFound

actionHandler :: PushStateInterface -> Widget HTML Domain.PageActions -> Widget HTML Domain.PageActions
actionHandler navInterface component = do
    action <- component
    case action of
        Domain.GotoPage page -> do
            _ <- liftEffect $ navInterface.pushState (unsafeToForeign {}) (printRoute $ pageToRoute $ page)
            actionHandler navInterface component

main :: Effect Unit
main = do
    -- Setup hooks so that we can handle navigating using pushState() (incl back + forward browser buttons)
    navInterface <- makeInterface
    _ <- navInterface.listen (\location ->
        let newRoute = parseRoute location.pathname in
        
        -- If we wanted to pop the location.state here we could do so first
        runWidgetInDom "root" $ actionHandler navInterface $ withNavbar $ renderPage $ routeToPage newRoute
    )

    -- Get the page we just landed on
    route <- currentRoute

    runWidgetInDom "root" $ actionHandler navInterface $ withNavbar $ renderPage $ routeToPage route
