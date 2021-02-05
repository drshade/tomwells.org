module Main where

import Prelude

import Concur.React.Run (runWidgetInDom)
import Content (blogArticles, restful_in_peace, what_i_look_for_in_a_developer)
import Data.Either (either)
import Data.Foldable (find)
import Data.Maybe (fromMaybe, maybe)
import Domain (Page(..)) as Domain
import Effect (Effect)
import Functions (fuzzyFindArticleBySlug)
import Nav (Route(..), currentRoute, parseRoute)
import Render (renderPage)
import Routing.PushState (makeInterface)

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

main :: Effect Unit
main = do
    -- Setup hooks so that we can handle navigating using pushState() (incl back + forward browser buttons)
    navInterface <- makeInterface
    _ <- navInterface.listen (\location ->
        let newRoute = parseRoute location.pathname in
        
        -- If we wanted to pop the location.state here we could do so first
        runWidgetInDom "root" $ renderPage $ routeToPage newRoute
    )

    -- Get the page we just landed on
    route <- currentRoute

    runWidgetInDom "root" $ renderPage $ routeToPage route
