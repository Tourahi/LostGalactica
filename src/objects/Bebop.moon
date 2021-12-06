BebopFactory = assert require 'src/objects/BebopFactory'

export class Bebop extends GameObject
  new: (area, x, y, opts) =>
    super area, x, y
    ship = opts.ship
    type = opts.type

    -- Members
    @polygons = {}
    @x, @y = 0,0
    @w, @h = 0,0
    @r = 0
    @v = 0
    @maxV = 0
    @a = 0
    @rv = 0
    @area = area
    
    -- Methods
    @follow = ->
    @draw = ->
    -- @burn = ->
    @shoot = ->
    @die = ->

    -- Set Bebop data
    BebopFactory[type] self, ship, x, y

    @collider = @area.world\newCircleCollider @x, @y, @w
    
    @collider\setObject self
    @collider\setPreSolve (c1, c2, contact)->
        if c1.id == @area.room.player.id
            contact\setEnabled false

  destroy: =>
    super self