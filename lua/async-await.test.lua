local aw = require('lua/async-await')
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

local main = aw.async(function()
    return aw.await(hello_world)
end)

main(function (...)
  print(...)
end)
