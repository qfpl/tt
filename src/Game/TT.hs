{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}

module Game.TT where

import Control.Lens
import Data.Time

data Player a =
  Player {
    _name :: 
      String
  , _display ::
      String
  , _email ::
      String
  , _playerValue ::
      a
  }
  deriving (Eq, Ord, Show)

data Score =
  Score {
    _value ::
      Integer
  }
  deriving (Eq, Ord, Show)
  
data Challenge a =
  Challenge {
    _time ::
      UTCTime
  , _challengeFrom ::
      Player a
  , _challengeTo ::
      Player a
  }
  deriving (Eq, Ord, Show)

data Result =
  Result {
    _played ::
      UTCTime
  , _gamescore ::
      Challenge Score
  }
  deriving (Eq, Ord, Show)

newtype Results =
  Results 
    [Result]
  deriving (Eq, Ord, Show)

makeClassy ''Player
makeClassy ''Score
makeClassy ''Challenge
makeClassy ''Result
makeClassy ''Results
makeWrapped ''Results

