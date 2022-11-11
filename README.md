# m
A module for creating modules in defold

## Intro
A problem encountered when using [hot reloading in defold](https://defold.com/manuals/hot-reload/) is that modules are not reimported by scripts and modules not reloaded. See [hot reloading modules](https://defold.com/manuals/modules/#hot-reloading-modules) to see why this happens and how it's fixed.

## Installation
To use this, add it Defold  as a library dependency. Open your game.project file and in the dependencies field under project add:
`https://github.com/wistpotion/m/archive/refs/tags/1.0.zip`, or add a different release.

## Usage
Using `m` is very simple. When you declare a module with this format:
```lua
local M = {}

function M.potato()
  return "potato"
end

return M

```
You simply replace the empty table in the start with `m(...)`. `...` is a variable that points to the path to the file (for example `main.potato`) when use in the top scope of the file. The new, hot reloadable module becomes:
```lua
local m = require "m"

local M = m(...)

function M.potato()
  return "potato"
end

return M
```

## Pitfalls
Just because the module is reloaded doesn't mean code is rerun. Scripts functions like `init` are not rerun upon reload. See [the reload function](https://defold.com/manuals/hot-reload/#the-on_reload-function) for a way to deal with that.
