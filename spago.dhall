{ name = "backend"
, dependencies =
  [ "console"
  , "effect"
  , "exceptions"
  , "express"
  , "integers"
  , "maybe"
  , "node-http"
  , "node-process"
  , "prelude"
  , "psci-support"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
