module Test.Main where

import Prelude

import Data.Array (sortWith)
import Data.Fuzzy (FuzzyStr(..), matchStr)
import Effect (Effect)

matchTest :: Unit -> Effect Unit
matchTest _ =
    let
        input = "restyfunctions"
        cases = 
            [ "restful-in-peace"
            , "what-i-look-for-in-a-developer"
            , "intro-to-fluid-infrastructure"
            , "practical-functional-programming"
            , "rocking-your-world-js"
            ]
        fuzzies = cases <#> (\c -> matchStr true input c)
        sorted = fuzzies # sortWith (\(FuzzyStr f) -> f.ratio)
        -- _ = trace (sorted) (\_ -> unit)
    in
    pure unit


main :: Effect Unit
main = 
    matchTest unit

