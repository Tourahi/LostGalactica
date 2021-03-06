-- input bindings
export Tint = assert require 'src/libs/Tint'
export Leak = assert require 'src/libs/Leak'
export Vector2D = assert require 'src/libs/Vector2D'
assert require 'src/libs/Colors'


import random from love.math
M = assert require 'moon'
export Log = assert require 'libs/log/log'
export Dump = M.p

Dump Log

export Graphics = love.graphics
export Window = love.window
export Keyboard = love.keyboard
export Filesystem = love.filesystem

-- Game modules
export Timer = assert require 'libs/EnhancedTimer/EnhancedTimer'
export Camera = assert require 'libs/hump/camera'
export Physics = assert require 'libs/windfield/windfield'
export fn = assert require 'libs/Moses/moses'
draft = assert require 'libs/draft/draft'
export Draft = draft!
assert require 'libs/MeowCore'
assert require 'libs/utf8'
export Flux = MeowC.core.flux


assert require 'src/objects/Area'
assert require 'src/GameObject'


-- rooms
export G_currentRoom = nil


-- Utils
export Utils = assert require 'src/Utils'
export Gtimer = Timer!

-- table
table.random = (t) ->
  t[love.math.random(1, #t)]


export Uid = ->
  f = (x) ->
    r = random(16) - 1
    r = (x == "x") and (r + 1) or (r % 4) + 9
    return ("0123456789abcdef")\sub r, r
  return (("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx")\gsub("[xy]", f))


-- WARN : Can return dicimals
export Random = (min, max) ->
    min, max = min or 0, max or 1
    return (min > max and (love.math.random()*(min - max) + max)) or (love.math.random()*(max - min) + min)

love.math.clamp = (val, min, max) ->
  assert val and min and max, "Please provide all the parameters. [love.math.clamp]"
  if min > max then min, max = max, min
  math.max min, math.min(max, val)

export Fonts = {
  Basteleur: 'assets/fonts/basteleur/fonts/ttf/Basteleur-Bold.ttf'
  OuroborosR: 'assets/fonts/ouroboros-master/fonts/Ouroboros-Regular.otf'
  TricksterM: 'assets/fonts/Trickster-master/fonts/Trickster-Reg.ttf'
  FTitlesHand: 'assets/fonts/FoundationTitlesHand/FoundationTitlesHand-v0.85.ttf'
  Connection:  'assets/fonts/connection-iii-font/ConnectionIii-Rj3W.otf'
}

-- Love vars
love.slow = 1 -- secs
love.flash = nil
