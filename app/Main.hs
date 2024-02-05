{-# OPTIONS_GHC -Wno-unused-top-binds #-}

module Main (main) where

import API.Tweets
import API.Users
import Control.Monad
import Network.HTTP.Client (newManager)
import Network.HTTP.Client.TLS (tlsManagerSettings)
import Servant.Client

showAllTweets :: IO ()
showAllTweets = do
  manager' <- newManager tlsManagerSettings
  res <- runClientM getAllTweets (mkClientEnv manager' (BaseUrl Https "twitturin-api.onrender.com" 443 ""))

  case res of
    Left err -> print err
    Right tweets -> forM_ tweets print

showAllUsers :: IO ()
showAllUsers = do
  manager' <- newManager tlsManagerSettings
  res <- runClientM getAllUsers (mkClientEnv manager' (BaseUrl Https "twitturin-api.onrender.com" 443 ""))

  case res of
    Left err -> print err
    Right tweets -> forM_ tweets print

main :: IO ()
main = do
  putStrLn "Twitturin api"

  showAllTweets
