{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeFamilies #-}

module Game.TT where

import Control.Lens
import Data.Time

data Player =
  Player {
    _name :: 
      String
  , _display ::
      String
  , _email ::
      String
  , _avatar ::
      String
  }
  deriving (Eq, Ord, Show)

data Score =
  GameScore [(Integer, Integer)]
  | Forfeit1
  | Forfeit2
  deriving (Eq, Ord, Show)
  
data Challenge a =
  Challenge {
    _time ::
      UTCTime
  , _challengeFrom ::
      Player
  , _challengeTo ::
      Player
  , _challengeScore :: 
      a
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

newtype LadderEntry =
  LadderEntry 
    (Either (Challenge ()) Result)
  deriving (Eq, Ord, Show)

data Ladder =
  Ladder {
    _laddername ::
      String
  , _ladderentries ::
      [LadderEntry]
  }
  deriving (Eq, Ord, Show)

makeClassy ''Player
makeClassy ''Score
makeClassy ''Challenge
makeClassy ''Result
makeClassy ''LadderEntry
makeWrapped ''LadderEntry

