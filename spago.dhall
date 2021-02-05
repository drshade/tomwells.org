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
  , "generics-rep"
  , "js-timers"
  , "psci-support"
  , "random"
  , "routing"
  , "routing-duplex"
  , "simple-json"
  , "strings"
  , "web-html"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
