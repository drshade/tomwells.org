module Domain where

import Prelude

import Data.Date (Date)
import Data.Maybe (Maybe)

import Data.Generic.Rep (class Generic)
import Data.Generic.Rep.Eq (genericEq)
import Data.Generic.Rep.Show (genericShow)

data Page
    = SingleArticle Article
    | ListOfArticles (Array Article)
    | CV
    | Contact
    | NotFound

data PageActions
    = GotoPage Page

newtype Article = Article
    { slug :: String
    , title :: String
    , keywords :: Array String
    , cover :: Image
    , summary :: String
    , body :: Array FlowComponent
    , author :: Author
    , date :: Date
    }

type Author =
    { name :: String
    , email :: String
    , bio :: String
    }

data Language
    = PureScript
    | JavaScript

type SourceCode =
    { lang :: Language
    , body :: String
    }

type Image = 
    { src :: String
    , alt :: String
    , caption :: Maybe String
    }

newtype YouTube = YouTube
    { src :: String
    , preview :: String
    }

type Link =
    { title :: String
    , link :: String
    }

type Quote =
    { quote :: String
    , author :: String
    }

type Bullets = 
    { start :: String
    , points :: Array String
    }

data FlowComponent
    = FlowParagraph String
    | FlowSection String
    | FlowLink Link
    | FlowQuote Quote
    | FlowBullets Bullets
    | FlowSourceCode SourceCode
    | FlowImage Image
    | FlowYouTube YouTube
