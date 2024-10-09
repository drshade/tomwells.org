module TomWellsOrg.Nav where

import Prelude

import Data.Either (either)
import Data.Generic.Rep (class Generic)
import Effect (Effect)
import Routing.Duplex (RouteDuplex', parse, path, print, root, segment, string)
import Routing.Duplex.Generic (noArgs, sum)
import Web.HTML (window)
import Web.HTML.Location (pathname)
import Web.HTML.Window (location)

data Route
    = BlogSummary
    | BlogArticle String
    | Stream
    | Resume
    | Contact
    | Guestbook
    | NotFound

derive instance genericRoute ∷ Generic Route _

routes ∷ RouteDuplex' Route
routes = root $ sum
    { "BlogSummary": path "blog" noArgs
    , "BlogArticle": path "blog" (string segment)
    , "Stream": noArgs
    , "Resume": path "cv" noArgs
    , "Contact": path "contact" noArgs
    , "Guestbook": path "guestbook" noArgs
    , "NotFound": path "notfound" noArgs
    }

-- Our lekker handlers for turning URLs into Pages and back again
parseRoute ∷ String → Route
parseRoute pathname = either (\_ → NotFound) identity $ parse routes pathname

printRoute ∷ Route → String
printRoute = print routes

-- Find the Route that reflects the current location (i.e. the one currently in window.location)
currentRoute ∷ Effect Route
currentRoute = do
    -- Get the page we just landed on (from window.location basically)
    window >>= location >>= pathname <#> parseRoute