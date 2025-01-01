---@diagnostic disable: undefined-global
return {
  s({ desc = "Current time", name = "time", trig = "time" }, {
    f(function()
      return os.date("%H:%M")
    end),
  }),

  s({ desc = "Current time with seconds", name = "times", trig = "times" }, {
    f(function()
      return os.date("%H:%M:%S")
    end),
  }),
}
