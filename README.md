# async-await.lua

Write async function more like javascript async/await

#### `await` the async callback function

``` lua
local aw = require('async-await')
local timer = vim.loop.new_timer()

aw.async(function ()

  local hello = aw.await(function (cb)
    timer:start(1000, 0, function ()
      cb('hello')
    end)
  end)

  local world = aw.await(function (cb)
    timer:start(1000, 0, function ()
      cb('world')
    end)
  end)

  print(hello, world)
end)
```

#### `await` the `async` function

``` lua
local aw = require('async-await')
local timer = vim.loop.new_timer()

local hello_world = aw.async(function ()

  local hello = aw.await(function (cb)
    timer:start(1000, 0, function ()
      cb('hello')
    end)
  end)

  local world = aw.await(function (cb)
    timer:start(1000, 0, function ()
      cb('world')
    end)
  end)

  return hello,world
end)

aw.async(function()
    local hello, world = aw.await(hello_world)
    print(hello, world)
end)
```
