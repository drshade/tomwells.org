module Play where

import Prelude

import Effect (Effect)
import Effect.Console (log)

main ∷ Effect Unit
main =
    let
        something ∷ Int
        something = 5

        f =
            ( \x →
                  let
                      somethingElse = 10
                  in
                      x + somethingElse
            )
    in
        log $ "hello vim" <> show (f 10)
