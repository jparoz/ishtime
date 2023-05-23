(* Compile using `mlton ishtime.sml` *)

open Date

val now = fromTimeLocal (Time.now ())

val spokenHours =
  [ " twelve"
  , " one"
  , " two"
  , " three"
  , " four"
  , " five"
  , " six"
  , " seven"
  , " eight"
  , " nine"
  , " ten"
  , " eleven"
  ]

val sentence =
  let val hours = hour now + (minute now div 33)
  in List.nth (spokenHours, hours mod 12)
  end

val prefixes =
  [ " five past"
  , " ten past"
  , " a quarter past"
  , " twenty past"
  , " twenty-five past"
  , " half past"
  , " twenty-five to"
  , " twenty to"
  , " a quarter to"
  , " ten to"
  , " five to"
  ]

val sentence =
  if minute now >= 58 orelse minute now <= 2
    then sentence ^ " o'clock"
    else (List.nth (prefixes, (minute now - 3) div 5)) ^ sentence

val _ = print ("It's" ^ sentence ^ ".\n")
