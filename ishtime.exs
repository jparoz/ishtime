#!/usr/bin/env elixir

defmodule Ishtime do
  import Integer, only: [floor_div: 2, mod: 2]

  def ishtime({h, m, _} \\ elem(:calendar.local_time, 1)) do
    minutes =
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

  hours =
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

    h_rounded = h + (floor_div m, 33)
    hour = Enum.at hours, mod(h_rounded, 12)
    if m <= 2 or m >= 58 do
      "It's #{hour} o'clock."
    else
      minute = Enum.at minutes, floor_div(m-3, 5)
      "It's #{minute} #{hour}."
    end
  end

  # | m <= 2 || m > 57 = concat [msg, " ", hour, " o'clock."]
  # | otherwise        = concat [msg, " ", minute, " ", hour, "."]
  # where
  #   h' = h + (m `div` 33) -- Round the hour, if it's "to" something.
  #   hour = hours !! (h' `mod` 12)
  #   minute = minutes !! ((m - 3) `div` 5)

end

IO.puts Ishtime.ishtime
