{-# LANGUAGE DeriveGeneric #-}

module Types.Major (Major (..)) where

import Data.Aeson
import GHC.Generics (Generic)

data Major = SE | AD | ME | IT | BM | CIE | AE
  deriving (Show, Eq, Generic)

instance FromJSON Major

instance ToJSON Major