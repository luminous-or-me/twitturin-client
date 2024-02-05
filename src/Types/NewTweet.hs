{-# LANGUAGE DeriveGeneric #-}
{-# OPTIONS_GHC -Wno-missing-export-lists #-}

module Types.NewTweet where

import Data.Aeson (ToJSON)
import Data.Text (Text)
import GHC.Generics (Generic)

newtype NewTweet = NewTweet
  { content :: Text
  }
  deriving (Show, Generic)

instance ToJSON NewTweet