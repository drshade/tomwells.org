module TomWellsOrg.Highlight where

import Prelude

import Effect (Effect)
import Data.Unit (unit)

foreign import applyHighlighting :: Unit -> Effect Unit