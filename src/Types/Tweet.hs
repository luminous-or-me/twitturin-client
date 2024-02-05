{-# LANGUAGE DeriveGeneric #-}

module Types.Tweet (Tweet (..)) where

import Data.Aeson
import Data.Text
import GHC.Generics
import Types.User (User)

data Tweet = Tweet
  { id :: Text,
    content :: Text,
    author :: User
  }
  deriving (Show, Generic)

instance FromJSON Tweet
