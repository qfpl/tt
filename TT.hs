{-# LANGUAGE TemplateHaskell #-}

module TT where

import Data.Time

data Player =
  Player {
    _name :: 
      String
  , _display ::
      String
  , _email ::
      String
  }
  deriving (Eq, Ord, Show)

data Challenge =
  Challenge {
    _time ::
      UTCTime
  , _from ::
      Player
  , _to ::
      Player
  }
  deriving (Eq, Ord, Show)

data Result =
  Result {
    _played ::
      UTCTime
  , _challenge ::
      Challenge
  }
  deriving (Eq, Ord, Show)