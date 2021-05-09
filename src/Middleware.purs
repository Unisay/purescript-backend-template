module Middleware where

import Node.Express.Types (Middleware)

foreign import jsonBodyParser :: Middleware
