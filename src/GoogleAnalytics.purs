module TomWellsOrg.GoogleAnalytics where

import Effect (Effect)
import Prelude (Unit)

foreign import track ∷ String → Effect Unit