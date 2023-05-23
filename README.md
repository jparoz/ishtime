# ishtime

A collection of implementations
of a simple idea:
telling the time as you would tell a friend.

## Rules

Each implementation may differ in specific features,
but at minimum **should print the current time in English
when called on the command line.**
Where a language doesn't permit command line execution,
an appropriate equivalent for the language's context should be provided.

## Implementations

| Language         | Command line output | Library API | Specify time to format |
| ---------------- | :-----------------: | :---------: | :--------------------: |
| [Javascript]     | ✅                  | ✅          | ✅                     |
| [Rust]           | ✅                  | ✅          | ✅                     |
| [Ruby]           | ✅                  | ❌          | ❌                     |
| [Haskell]        | ✅                  | ❌          | ❌                     |
| [Chicken Scheme] | ✅                  | ❌          | ❌                     |
| [Standard ML]    | ✅                  | ❌          | ❌                     |
| [Elixir]         | ✅                  | ✅          | ✅                     |
| [Lua]            | ✅                  | ❌          | ❌                     |

[Javascript]: ishtime.js
[Rust]: ishtime-rs/src/main.rs
[Ruby]: ishtime.rb
[Haskell]: ishtime.hs
[Chicken Scheme]: ishtime.scm
[Standard ML]: ishtime.sml
[Elixir]: ishtime.exs
[Lua]: ishtime.lua
