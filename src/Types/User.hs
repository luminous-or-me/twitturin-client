{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.User (User (..)) where

import Data.Aeson
import Data.Aeson.Types
import Data.Text
import GHC.Generics (Generic)

data UserKind = Teacher | Student
  deriving (Show, Eq)

data Major = Se | Ad | Me | It | Bm | Cie | Ae
  deriving (Show, Eq)

instance FromJSON Major where
  parseJSON :: Value -> Parser Major
  parseJSON = withText "Major" $ \v ->
    case toUpper v of
      "SE" -> pure Se
      "ME" -> pure Me
      "IT" -> pure It
      "AD" -> pure Ad
      "BM" -> pure Bm
      "CIE" -> pure Cie
      "AE" -> pure Ae
      _ -> fail "Invalid major"

instance FromJSON UserKind where
  parseJSON :: Value -> Parser UserKind
  parseJSON = withText "UserKind" $ \v ->
    case toLower v of
      "student" -> pure Student
      "teacher" -> pure Teacher
      _ -> fail "Invalid kind"

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