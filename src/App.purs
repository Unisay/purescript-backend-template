module App where

import Prelude
import Node.Express.App (App, get, post, useExternal)
import Middleware as Middleware
import Node.Express.Handler (Handler)
import Effect.Class (liftEffect)
import Effect.Console (log)
import Node.Express.Response (send)
import Node.Express.Request (getBodyParam)
import Data.Maybe (Maybe(..))

indexHandler :: Handler
indexHandler = do
  liftEffect $ log "GET to /"
  send
    "Make POST request with JSON body\
    \ like {\"message\": <msg>} to get your message back"

echoHandler :: Handler
echoHandler = do
  liftEffect $ log "POST to /"
  messageParam <- getBodyParam "message"
  case messageParam of
    Nothing -> send "You did not say anything"
    Just message -> send $ "You said: " <> message

app :: App
app = do
  useExternal Middleware.jsonBodyParser
  get "/" indexHandler
  post "/" echoHandler
