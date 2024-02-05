{-# LANGUAGE DeriveGeneric #-}
{-# OPTIONS_GHC -Wno-name-shadowing #-}

module Types.NewUser (NewUser, toNewStudent, toNewTeacher) where

import Data.Aeson
import Data.Text (Text)
import GHC.Generics (Generic)
import Types.Major (Major)
import Types.UserKind

data NewUser = NewUser
  { username :: Text,
    fullName :: Maybe Text,
    password :: Text,
    kind :: UserKind,
    studentId :: Maybe Text,
    major :: Maybe Major,
    subject :: Maybe Text,
    birthday :: Maybe Text
  }
  deriving (Show, Generic)

instance ToJSON NewUser

toNewStudent :: Text -> Text -> Text -> Major -> Maybe Text -> Maybe Text -> NewUser
toNewStudent username password studentId major fullName birthday =
  NewUser
    { username = username,
      fullName = fullName,
      password = password,
      studentId = Just studentId,
      major = Just major,
      subject = Nothing,
      kind = Student,
      birthday = birthday
    }

toNewTeacher :: Text -> Text -> Text -> Maybe Text -> Maybe Text -> NewUser
toNewTeacher username password subject fullName birthday =
  NewUser
    { username = username,
      fullName = fullName,
      password = password,
      studentId = Nothing,
      major = Nothing,
      subject = Just subject,
      kind = Teacher,
      birthday = birthday
    }