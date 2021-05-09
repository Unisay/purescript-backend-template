module Main where

import Prelude hiding (apply)
import Data.Int as Int
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Effect.Exception (error, throwException)
import Node.Express.App (listenHttp)
import Node.HTTP (Server)
import Node.Process (lookupEnv)
import App (app)

main :: Effect Server
main = do
  port <- initPort
  listenHttp app port \_ -> do
    log "┌───────────────────┐"
    log $ "│ Listening on " <> show port <> " │"
    log "└───────────────────┘"

initPort :: Effect Int
initPort = do
  optionalPortValue <- lookupEnv "PORT"
  case optionalPortValue of
    Nothing -> log "No PORT env variable found, falling back to 8080" $> 8080
    Just str -> case Int.fromString str of
      Nothing -> throwException $ error $ "Invalid HTTP port: " <> str
      Just port -> pure port
