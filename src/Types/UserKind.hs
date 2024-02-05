{-# LANGUAGE InstanceSigs #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.UserKind (UserKind (..)) where

import Data.Aeson
import Data.Aeson.Types
import Data.Text

data UserKind = Teacher | Student
  deriving (Show, Eq)

instance FromJSON UserKind where
  parseJSON :: Value -> Parser UserKind
  parseJSON = withText "UserKind" $ \v ->
    case toLower v of
      "student" -> pure Student
      "teacher" -> pure Teacher
      _ -> fail "Invalid kind"

instance ToJSON UserKind where
  toJSON :: UserKind -> Value
  toJSON Student = String "student"
  toJSON Teacher = String "teacher"
