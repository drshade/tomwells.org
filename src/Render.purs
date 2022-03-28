module TomWellsOrg.Render where

import Prelude

import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as DOM
import Concur.React.Props as Props
import Control.Alt ((<|>))
import Data.Maybe (fromMaybe)
import Data.String (trim)
import TomWellsOrg.Art as Art
import TomWellsOrg.Blog (articles)
import TomWellsOrg.CV (content) as CV
import TomWellsOrg.Dapps.GuestMint.Main as GuestMint
import TomWellsOrg.Domain (Article(..), FlowComponent(..), Language(..), Page(..), PageActions(..), StreamEntry)
import TomWellsOrg.Functions (printDate, sortedByMostRecent)
import TomWellsOrg.Stream (content) as Stream

renderFlowComponent :: forall a. FlowComponent -> Widget HTML a
renderFlowComponent (FlowParagraph text) = DOM.p [] [ DOM.text text ]
renderFlowComponent (FlowMajorHeader text) = DOM.h1 [] [ DOM.text text ]
renderFlowComponent (FlowSection text) = DOM.h2 [] [ DOM.text text ]
renderFlowComponent (FlowLink link) = DOM.a [ Props.href link.link ] [ DOM.text link.title ]
renderFlowComponent (FlowQuote quote) = DOM.p [] [ DOM.text $ "\"" <> quote.quote <> "\" - " <> quote.author  ]
renderFlowComponent (FlowImage image) =
    DOM.img [ Props.src image.src, Props.alt image.alt, Props.width "100%" ]
    <|> (image.caption <#> (\caption -> DOM.div [ Props.className "caption" ] [ DOM.text $ "(" <> caption <> ")" ]) # fromMaybe (DOM.div' []) )
renderFlowComponent (FlowBullets bullets) =
    DOM.p [] [ DOM.text bullets.start ]
    <|> (DOM.ul [] (bullets.points <#> \point -> DOM.li [] [ DOM.text point ]))
renderFlowComponent (FlowYouTube video) =
    DOM.div 
        [ Props.className "iframewrapper" ] 
        [ DOM.iframe 
            [ Props.src ("https://www.youtube.com/embed/" <> video.id) 
            , Props.frameBorder "0"
            , Props.allowFullScreen true
            , Props.width "560"
            , Props.height "349"
            ] []
        ]
renderFlowComponent (FlowSourceCode { lang, body }) =
    let
        langClass = 
            case lang of
                Haskell -> "haskell"
                PureScript -> "haskell"
                JavaScript -> "javascript"
                CSharp -> "csharp"
                Pseudo -> "plaintext"
    in
    DOM.pre [] 
        [ DOM.code [ Props.className $ "language-" <> langClass ]
            [ DOM.text $ trim body 
            ]
        ]

withNavbar :: Widget HTML PageActions -> Widget HTML PageActions
withNavbar component = do
    DOM.div [ Props.className "centered" ]
        [ DOM.a [ (GotoPage (Stream Stream.content)) <$ Props.onClick ] [ DOM.text "Stream" ]
        , DOM.text " | "
        , DOM.a [ (GotoPage (Guestbook)) <$ Props.onClick ] [ DOM.text "Guestbook" ]
        , DOM.text " | "
        , DOM.a [ (GotoPage (ListOfArticles articles)) <$ Props.onClick ] [ DOM.text "Blog" ]
        , DOM.text " | "
        , DOM.a [ (GotoPage CV) <$ Props.onClick ] [ DOM.text "About me" ]
        , DOM.text " | "
        , DOM.a [ (GotoPage Contact) <$ Props.onClick ] [ DOM.text "Contact" ]
        ]
    <|> component

renderPage :: Page -> Widget HTML PageActions
renderPage (SingleArticle (Article article)) =
    DOM.h1 [] 
        [ -- DOM.img [ Props.src article.cover.src, Props.alt article.cover.alt, Props.width "100%" ]
         DOM.text article.title 
        ]
    <|> (DOM.div [] (article.body <#> renderFlowComponent))
    <|> (DOM.h3 [] 
            [ DOM.text $ "Published on " <> printDate article.date
            , DOM.text $ " by " <> article.author.name
            ]
        )

renderPage (Stream content) =
    let
        render' :: StreamEntry -> Widget HTML PageActions
        render' { date, entry } =
            (DOM.div [] 
                (entry <#> renderFlowComponent)
                <|> DOM.div [ Props.className "centered", Props.className "caption" ] [ DOM.text $ "(uploaded " <> printDate date <> ")" ]
            )
    in
        DOM.div [ Props.className "ascii-art" ] [ Art.rainbow Art.stream ]
        <|> DOM.p []
            [ DOM.div [] (content <#> render')
            ]

renderPage Guestbook =
    DOM.div [ Props.className "ascii-art" ] [ Art.rainbow Art.guestbook ]
    <|> DOM.p [] 
        [ DOM.div [] [ DOM.text "My guestbook runs on the NEAR protocol blockchain, please try it out!" ]
        , DOM.div [] [ DOM.text "------------------------" ]
        , GuestMint.root
        ]

renderPage (ListOfArticles articles) =
    let
        render' :: Article -> Widget HTML PageActions
        render' (Article article) = 
            DOM.div []
                [ DOM.text "$> "
                , DOM.a [ (GotoPage (SingleArticle (Article article)) <$ Props.onClick) ] [ DOM.text article.title ]
                , DOM.text $ " (" <> printDate article.date <> ")"
                ]
    in
    DOM.div [ Props.className "ascii-art" ] [ Art.rainbow Art.blog ]
    <|> DOM.p []
        [ DOM.div [] [ DOM.text "Things i've written down" ]
        , DOM.div [] [ DOM.text "------------------------" ]
        , DOM.div [] (articles # sortedByMostRecent <#> render')
        ]

renderPage CV = 
    DOM.div [ Props.className "ascii-art" ] [ Art.rainbow Art.cv ]
    <|> DOM.p []
        [ DOM.div [] (CV.content <#> renderFlowComponent)
        ]

renderPage Contact = 
    DOM.div [ Props.className "ascii-art" ] [ Art.rainbow Art.contact ]
    <|> DOM.p []
        [ DOM.div [] [ DOM.text "email $> tom(>>=)tomwells.org" ]
        , DOM.div [] 
            [ DOM.text "linkedin $> " 
            , DOM.a 
                [ Props.href "https://www.linkedin.com/in/tomwells80/" ]
                [ DOM.text "https://www.linkedin.com/in/tomwells80/" ]
            ]
        , DOM.div [] 
            [ DOM.text "youtube $> "
            , DOM.a
                [ Props.href "https://www.youtube.com/c/TomWells" ]
                [ DOM.text "https://www.youtube.com/c/TomWells" ]
            ]
        ]

renderPage NotFound = DOM.div [ Props.className "ascii-art" ] [ Art.rainbow Art.notFound ]
