{-# LANGUAGE DeriveGeneric #-}

module Types.User (User (..)) where

import Data.Aeson
import Data.Text
import GHC.Generics (Generic)
import Types.Major
import Types.UserKind

data User = User
  { id :: Text,
    username :: Text,
    fullName :: Maybe Text,
    studentId :: Maybe Text,
    major :: Maybe Major,
    subject :: Maybe Text,
    birthday :: Maybe Text,
    kind :: UserKind
  }
  deriving (Show, Generic)

instance FromJSON User