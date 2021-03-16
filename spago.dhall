{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ "concur-react"
  , "console"
  , "debug"
  , "effect"
  , "foreign"
  , "formatters"
  , "fuzzy"
  , "js-timers"
  , "psci-support"
  , "random"
  , "routing"
  , "routing-duplex"
  , "strings"
  , "web-html"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
