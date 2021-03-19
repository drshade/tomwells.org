module TomWellsOrg.Main where

import Prelude

import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.Run (runWidgetInDom)
import Data.Maybe (maybe)
import Effect (Effect)
import Effect.Class (liftEffect)
import Foreign (unsafeToForeign)
import Routing.PushState (PushStateInterface, makeInterface)
import TomWellsOrg.Blog (articles)
import TomWellsOrg.Domain (Article(..), Page(..), PageActions(..)) as Domain
import TomWellsOrg.Functions (fuzzyFindArticleBySlug)
import TomWellsOrg.Highlight (applyHighlighting)
import TomWellsOrg.Nav (Route(..), currentRoute, parseRoute, printRoute)
import TomWellsOrg.Render (renderPage, withNavbar)
import TomWellsOrg.Stream (content)

routeToPage :: Route -> Domain.Page
routeToPage BlogSummary = Domain.ListOfArticles articles
routeToPage (BlogArticle slug) =
    let
        found = fuzzyFindArticleBySlug articles slug
    in
    maybe Domain.NotFound Domain.SingleArticle found
routeToPage Stream = Domain.Stream content
routeToPage Résumé = Domain.CV
routeToPage Contact = Domain.Contact
routeToPage NotFound = Domain.NotFound


pageToRoute :: Domain.Page -> Route
pageToRoute (Domain.ListOfArticles _) = BlogSummary
pageToRoute (Domain.SingleArticle (Domain.Article a)) = BlogArticle a.slug
pageToRoute (Domain.Stream _) = Stream
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
        (runWidgetInDom "root" 
            $ actionHandler navInterface 
            $ withNavbar 
            $ renderPage 
            $ routeToPage newRoute)
            -- Apply code highlighting after render
            >>= (\_ -> applyHighlighting unit)
    )

    -- Get the page we just landed on
    route <- currentRoute

    (runWidgetInDom "root" 
        $ actionHandler navInterface 
        $ withNavbar 
        $ renderPage 
        $ routeToPage route)
        >>= (\_ -> applyHighlighting unit)
