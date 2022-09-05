module TomWellsOrg.Domain where

import Data.Date (Date)
import Data.Maybe (Maybe)

data Page
    = SingleArticle Article
    | ListOfArticles (Array Article)
    | Stream (Array StreamEntry)
    | CV
    | Contact
    | Guestbook
    | NotFound

data PageActions = GotoPage Page

newtype Article = Article
    { slug ∷ String
    , title ∷ String
    , keywords ∷ Array String
    , cover ∷ Image
    , summary ∷ String
    , body ∷ Array FlowComponent
    , author ∷ Author
    , date ∷ Date
    }

type Author =
    { name ∷ String
    , email ∷ String
    , bio ∷ String
    }

data Language
    = PureScript
    | JavaScript
    | CSharp
    | Pseudo
    | Haskell

type SourceCode =
    { lang ∷ Language
    , body ∷ String
    }

type Image =
    { src ∷ String
    , alt ∷ String
    , caption ∷ Maybe String
    }

type YouTube =
    { id ∷ String
    }

type Link =
    { title ∷ String
    , link ∷ String
    }

type Quote =
    { quote ∷ String
    , author ∷ String
    }

type Bullets =
    { start ∷ String
    , points ∷ Array String
    }

type StreamEntry =
    { date ∷ Date
    , entry ∷ Array FlowComponent
    }

data FlowComponent
    = FlowParagraph String
    | FlowMajorHeader String
    | FlowSection String
    | FlowLink Link
    | FlowQuote Quote
    | FlowBullets Bullets
    | FlowSourceCode SourceCode
    | FlowImage Image
    | FlowYouTube YouTube
