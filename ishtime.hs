#!/usr/bin/env runhaskell

module Main where

import Data.Time
  ( LocalTime (LocalTime),
    TimeOfDay (TimeOfDay),
    ZonedTime (ZonedTime),
    getZonedTime,
  )
import System.Environment (getArgs)

main :: IO ()
main = do
  time <- parseTime <$> getZonedTime
  args <- unwords <$> getArgs
  putStrLn . ishtime time $
    if args == ""
      then "It's"
      else args

parseTime :: ZonedTime -> (Int, Int)
parseTime (ZonedTime (LocalTime _ (TimeOfDay h m _)) _) = (h, m)

ishtime :: (Int, Int) -> String -> String
ishtime (h, m) msg
  | m <= 2 || m > 57 = concat [msg, " ", hour, " o'clock."]
  | otherwise        = concat [msg, " ", minute, " ", hour, "."]
  where
    minute =
      [ "five past",
        "ten past",
        "a quarter past",
        "twenty past",
        "twenty-five past",
        "half past",
        "twenty-five to",
        "twenty to",
        "a quarter to",
        "ten to",
        "five to"
      ]
        !! ((m - 3) `div` 5)
    hour =
      [ "twelve",
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
        "ten",
        "eleven"
      ]
        !! (h' `mod` 12)
    h' = h + (m `div` 33) -- Round the hour, if it's "to" something.
