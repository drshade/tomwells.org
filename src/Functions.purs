module Functions where

import Prelude

import Data.Array (catMaybes, filter, head, reverse, sortWith)
import Data.Date (Date, Day, Month, Year, canonicalDate)
import Data.DateTime (DateTime(..))
import Data.Enum (toEnum)
import Data.Foldable (find)
import Data.Formatter.DateTime (FormatterCommand(..), format)
import Data.Fuzzy (Distance(..), FuzzyStr(..), matchStr)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (unwrap)
import Data.Rational (Rational, toNumber)
import Data.String (Pattern(..), Replacement(..), joinWith, replaceAll)
import Data.Time (Time(Time))
import Data.Time.Component (Hour, Millisecond, Minute, Second)
import Data.Tuple (Tuple(..))
import Debug.Trace (trace)
import Domain (Page(..))
import Effect.Class.Console (log)

constructDate :: Int -> Int -> Int -> Date
constructDate year month day =
    let 
        year' :: Year
        year' = fromMaybe bottom $ toEnum year

        month' :: Month
        month' = fromMaybe bottom $ toEnum month

        day' :: Day
        day' = fromMaybe bottom $ toEnum day
    in
    canonicalDate year' month' day'

printDate :: Date -> String
printDate date =
    let
        datetime = DateTime date (Time bottom bottom bottom bottom)
        formatter = (DayOfMonth : Placeholder " " : MonthFull : Placeholder " " : YearFull : Nil)
    in
    format formatter datetime

deslugify :: String -> String
deslugify input = 
    input # replaceAll (Pattern "-") (Replacement " ") 
        <<< replaceAll (Pattern "_") (Replacement " ") 

-- Using a fancy fuzzy matcher for this
fuzzyFindArticleBySlug :: Array Page -> String -> Maybe Page
fuzzyFindArticleBySlug pages slug =
    -- Rank all the pages by fuzzy distance from target slug
    let
        dists :: Array (Tuple Rational Page)
        dists = pages <#> (\p -> 
            case p of
                x @ (Article a) -> 
                    let fuzzystr = unwrap $ matchStr true (deslugify a.slug) (deslugify slug)
                    in Just $ Tuple fuzzystr.ratio x
                _ -> Nothing
        ) # catMaybes

        sorted = dists # sortWith (\(Tuple ratio page) -> ratio) # reverse

        -- Cool debug the matching
        debug = 
            "Slug: " <> (deslugify slug) <> "\n"
                <> (sorted <#> (\(Tuple ratio page) -> 
                    case page of
                        Article a -> (deslugify a.slug) <> " -> " <> show (toNumber ratio)
                        _ -> "invalid page"
                ) # joinWith "\n")
        _ = trace (debug) (\_ -> unit)

        -- Minimum ratio for matching (otherwise it's likely garbage)
        minimumRatio = 0.5
    in 
    sorted 
        # filter (\(Tuple ratio page) -> (toNumber ratio) >= minimumRatio) 
        <#> (\(Tuple ratio page) -> page) 
        # head