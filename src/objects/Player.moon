random = love.math.random

export class Player extends GameObject
  new: (area, x, y, opts = {}) =>
    super area, x, y, opts
    @x, @y = x, y
    @w, @h = 12, 12
    @collider = area.world\newCircleCollider @x, @y, @w
    @collider\setObject self

    -- Movement related properties
    @r = -math.pi / 2
    @rv = 1.66*math.pi
    @v = 0
    @maxV = 100
    @a = 100

    -- Timers
    @timer\every 0.24, -> @shoot!
    if opts.glitchEnabled
      @timer\every 5, -> @glitch!

    -- Temp vars
    @burnColor = Colors.aqua
    @tailBurn!

  update: (dt) =>
    super dt
    if input\down 'left'
      @r = @r - @rv*dt
    if input\down 'right'
      @r = @r + @rv*dt

    @v = math.min @v + @a*dt, @maxV
    @collider\setLinearVelocity @v*math.cos(@r), @v*math.sin(@r)

  draw: =>
    Graphics.circle 'line', @x, @y, @w
    Graphics.line @x, @y, @x + @w*math.cos(@r), @y + @w*math.sin(@r)

 
  shoot: =>
    d = 1.2*@w
    @area\addGameObject 'ShootEff', @x + 1.2*@w*math.cos(@r),
      @y + 1.2*@w*math.sin(@r), {player: self, d: d}
    @area\addGameObject 'Projectile', @x + 1.5*@w*math.cos(@r),
      @y + 1.5*@w*math.sin(@r), {r: @r}
    

  die: =>
    @dead = true
    if opts.flashEnabled
      Utils.screenFlash 3
    Utils.slowDt 0.2, 1
    with @area\getCamera!
      \shake 4, 40, 0.4
    for i = 1, love.math.random(8, 10) do @area\addGameObject 'PlayerExplode', @x, @y

 
  glitch: =>
    @area\addGameObject 'TickEff', @x, @y, {parent: self}

  tailBurn: =>
    @timer\every 0.01, ->
      @area\addGameObject 'TailBurn',
        @x - 0.9*@w*math.cos(@r) + 0.2*@w*math.cos(@r - math.pi/2),
        @y - 0.9*@w*math.sin(@r) + 0.2*@w*math.sin(@r - math.pi/2),
        {parent: self, r: random(2, 4), d: Random(0.15, 0.25), color: @burnColor}
  destroy: =>
    super self