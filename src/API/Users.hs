{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# OPTIONS_GHC -Wno-missing-export-lists #-}

module API.Users where

import Data.Data (Proxy (Proxy))
import Data.Text (Text)
import Servant.API
import Servant.Client (ClientM, client)
import Types.NewUser (NewUser)
import Types.User

type UserAPI =
  "api"
    :> "users"
    :> ( Get '[JSON] [User]
           :<|> (ReqBody '[JSON] NewUser :> PostCreated '[JSON] User)
           :<|> (Capture "id" Text :> Get '[JSON] User)
       )

userApi :: Proxy UserAPI
userApi = Proxy

getAllUsers :: ClientM [User]
getSpecificUser :: Text -> ClientM User
createUser :: NewUser -> ClientM User
getAllUsers :<|> createUser :<|> getSpecificUser = client userApi