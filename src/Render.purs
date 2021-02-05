module Render where

import Prelude

import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as DOM
import Concur.React.Props as Props
import Content (blogArticles)
import Control.Alt ((<|>))
import Data.Maybe (fromMaybe)
import Domain (Article(..), FlowComponent(..), Page(..), PageActions(..))
import Functions (printDate, sortedByMostRecent)

renderFlowComponent :: forall a. FlowComponent -> Widget HTML a
renderFlowComponent (FlowParagraph text) = DOM.p [] [ DOM.text text ]
renderFlowComponent (FlowSection text) = DOM.h2 [] [ DOM.text text ]
renderFlowComponent (FlowLink link) = DOM.a [ Props.href link.link ] [ DOM.text link.title ]
renderFlowComponent (FlowQuote quote) = DOM.p [] [ DOM.text $ "\"" <> quote.quote <> "\" - " <> quote.author  ]
renderFlowComponent (FlowImage image) =
    DOM.img [ Props.src image.src, Props.alt image.alt, Props.width "100%" ]
    <|> (image.caption <#> (\caption -> DOM.div [ Props.className "caption" ] [ DOM.text $ "(" <> caption <> ")" ]) # fromMaybe (DOM.div' []) )
renderFlowComponent (FlowBullets bullets) =
    DOM.p []
        [ DOM.text bullets.start ]
    <|> (DOM.ul [] 
            (bullets.points <#> \point -> DOM.li [] [ DOM.text point ])
        )

renderFlowComponent _ = DOM.h2 [] [ DOM.text "COMPONENT HERE" ]

withNavbar :: Widget HTML PageActions -> Widget HTML PageActions
withNavbar component = do
    DOM.div []
        [ DOM.a [ (GotoPage (ListOfArticles blogArticles)) <$ Props.onClick ] [ DOM.text "Home" ]
        , DOM.a [ (GotoPage CV) <$ Props.onClick ] [ DOM.text "About me" ]
        , DOM.a [ (GotoPage Contact) <$ Props.onClick ] [ DOM.text "Contact" ]
        ]
    <|> component

renderPage :: Page -> Widget HTML PageActions
renderPage (SingleArticle (Article article)) =
    DOM.h1 [] 
        [ DOM.img [ Props.src article.cover.src, Props.alt article.cover.alt, Props.width "100%" ]
        , DOM.text article.title 
        ]
    <|> (DOM.div [] (article.body <#> renderFlowComponent))
    <|> (DOM.h3 [] 
            [ DOM.text $ "Published on " <> printDate article.date
            , DOM.text $ " by " <> article.author.name
            ]
        )

renderPage (ListOfArticles articles) =
    let
        render' :: Article -> Widget HTML PageActions
        render' (Article article) = 
            DOM.div []
                [ DOM.a [ (GotoPage (SingleArticle (Article article)) <$ Props.onClick) ] [ DOM.text article.title ]
                , DOM.text " - "
                , DOM.text article.summary
                ]
    in
    DOM.h1 []
        [ DOM.img [ Props.src "/images/header-finger.jpg", Props.width "100%" ]
        , DOM.text "Published Articles"
        ]
    <|> (DOM.div [] (articles # sortedByMostRecent <#> render'))

renderPage CV = DOM.h1 [] [ DOM.text "CV RENDERER 2" ]
renderPage Contact = DOM.h1 [] [ DOM.text "CONTACT RENDERER" ]
renderPage NotFound = DOM.h1 [] [ DOM.text "NOT FOUND RENDERER 2" ]
