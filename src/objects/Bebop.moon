
export class Bebop extends GameObject
  @factory = {
    'B1a': assert require 'src/objects/bebops/B1a'
  }
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
    @offsetFromPlayer = Vector2D.zero
    @area = area
    
    -- Methods
    @follow = ->
    @draw = ->
    -- @burn = ->
    @shoot = ->
    @die = ->

    -- Set Bebop data
    @@factory[type] self, ship, x, y

    @collider = @area.world\newCircleCollider @x, @y, @w
    
    with @collider
        \setObject self
        \setCollisionClass 'Bebop'
        \setFixedRotation false
        \setLinearVelocity @v*math.cos(@r), @v*math.sin(@r)

  destroy: =>
    super self
