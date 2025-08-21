return {
    "mini.statusline",
    after = function()
        local statusline = require("mini.statusline")
        statusline.setup()
        statusline.section_location = function()
            return "%2l:%-2v"
        end
    end,
    before = function()
        require("lz.n").trigger_load("mini.icons")
    end,
    event = "DeferredUIEnter",
}
