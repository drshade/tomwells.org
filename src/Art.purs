module TomWellsOrg.Art where

import Prelude

import Color (fromInt, rgb, toHexString)
import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as DOM
import Concur.React.Props as Props
import Control.Alt ((<|>))
import Data.Array (head)
import Data.Array (zip, (..), length) as Array
import Data.Char (toCharCode)
import Data.Int (floor, round, toNumber)
import Data.Maybe (fromMaybe)
import Data.Monoid ((<>))
import Data.String (Pattern(..), Replacement(..), replaceAll, split, takeWhile, length) as String
import Data.String.CodeUnits (singleton, toCharArray)
import Data.Tuple (Tuple(..))

-- Generate your own at
-- https://patorjk.com/software/taag/#p=display&f=Graffiti&t=Type%20Something%20

nbsp :: String
nbsp = "\x00A0"

-- This is a truly horrible function that hacks together a gradient effect
rainbow :: forall a. String -> Widget HTML a
rainbow input =
    let ratio :: Int -> Int -> Int -> Int -> Int -> Int
        ratio t_min t_max v_min v_max v = round $ (toNumber v / toNumber ((v_max - v_min) + 1)) * toNumber ((t_max - t_min) + 1)
        rows :: Int
        rows = Array.length $ String.split (String.Pattern "\n") input
        cols = (String.length $ fromMaybe "" $ head $ String.split (String.Pattern "\n") input) + 1
        colour index = toHexString $ rgb (ratio 0 255 0 (cols - 1) (index `mod` cols)) 20 140
        point (Tuple index value) = DOM.span [ Props.style { color: colour index } ] [ DOM.text $ singleton value ]
    in 
        (DOM.div [] (point <$> Array.zip (Array.(..) 0 (String.length input)) (toCharArray input))) --DOM.text "dog"

tomwellsOrg :: String
tomwellsOrg = """  __                               .__  .__                                  
_/  |_  ____   _______  _  __ ____ |  | |  |   ______     ___________  ____  
\   __\/  _ \ /     \ \/ \/ // __ \|  | |  |  /  ___/    /  _ \_  __ \/ ___\ 
 |  | (  <_> )  Y Y  \     /\  ___/|  |_|  |__\___ \    (  <_> )  | \/ /_/  >
 |__|  \____/|__|_|  /\/\_/  \___  >____/____/____  > /\ \____/|__|  \___  / 
                   \/            \/               \/  \/            /_____/  """

stream :: String
stream = """          __                                 
  _______/  |________   ____ _____    _____  
 /  ___/\   __\_  __ \_/ __ \\__  \  /     \ 
 \___ \  |  |  |  | \/\  ___/ / __ \|  Y Y  \
/____  > |__|  |__|    \___  >____  /__|_|  /
     \/                    \/     \/      \/ """

guestbook :: String
guestbook = """                                __ ___.                  __    
   ____  __ __   ____   _______/  |\_ |__   ____   ____ |  | __
  / ___\|  |  \_/ __ \ /  ___/\   __\ __ \ /  _ \ /  _ \|  |/ /
 / /_/  >  |  /\  ___/ \___ \  |  | | \_\ (  <_> |  <_> )    < 
 \___  /|____/  \___  >____  > |__| |___  /\____/ \____/|__|_ \
/_____/             \/     \/           \/                   \/"""

blog :: String
blog = """___.   .__                 
\_ |__ |  |   ____   ____  
 | __ \|  |  /  _ \ / ___\ 
 | \_\ \  |_(  <_> ) /_/  >
 |___  /____/\____/\___  / 
     \/           /_____/  """

cv :: String
cv = """      ___.                  __                    
_____ \_ |__   ____  __ ___/  |_    _____   ____  
\__  \ | __ \ /  _ \|  |  \   __\  /     \_/ __ \ 
 / __ \| \_\ (  <_> )  |  /|  |   |  Y Y  \  ___/ 
(____  /___  /\____/|____/ |__|   |__|_|  /\___  >
     \/    \/                           \/     \/ """

contact :: String
contact = """.__    .__  __                                 ._.
|  |__ |__|/  |_    _____   ____    __ ________| |
|  |  \|  \   __\  /     \_/ __ \  |  |  \____ \ |
|   Y  \  ||  |   |  Y Y  \  ___/  |  |  /  |_> >|
|___|  /__||__|   |__|_|  /\___  > |____/|   __/__
     \/                 \/     \/        |__|   \/"""

notFound :: String
notFound = """                         _____  _______      _____  
  __________________    /  |  | \   _  \    /  |  | 
_/ __ \_  __ \_  __ \  /   |  |_/  /_\  \  /   |  |_
\  ___/|  | \/|  | \/ /    ^   /\  \_/   \/    ^   /
 \___  >__|   |__|    \____   |  \_____  /\____   | 
     \/                    |__|        \/      |__| """