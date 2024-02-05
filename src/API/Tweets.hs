{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module API.Tweets (TweetAPI, getAllTweets, getTweetById) where

import Data.Data (Proxy (Proxy))
import Data.Text (Text)
import Servant.API
import Servant.Client (ClientM, client)
import Types.Tweet

type TweetAPI =
  "api" :> "tweets"
    :> ( Get '[JSON] [Tweet]
           :<|> Capture "id" Text :> Get '[JSON] Tweet
       )

tweetApi :: Proxy TweetAPI
tweetApi = Proxy

getAllTweets :: ClientM [Tweet]
getTweetById :: Text -> ClientM Tweet
getAllTweets :<|> getTweetById = client tweetApi