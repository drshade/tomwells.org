module TomWellsOrg.GoogleAnalytics where

import Prelude (Unit)
import Effect (Effect)

foreign import track :: String -> Effect Unit