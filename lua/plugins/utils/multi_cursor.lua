return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",

    config = function()
        local mc = require("multicursor-nvim")

        mc.setup()

        local set = vim.keymap.set

        ----------------------------------------------------------------
        -- MATCH CURSORS (VISUAL MODE)
        ----------------------------------------------------------------
        set("x", "<C-n>", function() mc.matchAddCursor(1) end, { desc = "Add Cursor Next Match" }) -- Add next match
        set("x", "<C-q>", function() mc.matchSkipCursor(1) end, { desc = "Skip Next Match" }) -- Skip next match
        set("x", "<M-n>", function() mc.matchAddCursor(-1) end, { desc = "Add Cursor Previous Match" }) -- Add previous match
        set("x", "<M-q>", function() mc.matchSkipCursor(-1) end, { desc = "Skip Previous Match" }) -- Skip previous match
        ----------------------------------------------------------------
        -- LINE CURSORS
        ----------------------------------------------------------------
        set({ "n", "x" }, "<C-j>", function() mc.lineAddCursor(1) end, { desc = "Add Cursor Below" })
        set({ "n", "x" }, "<C-k>", function() mc.lineAddCursor(-1) end, { desc = "Add Cursor Above" })
        ----------------------------------------------------------------
        -- MANUAL CURSOR TOGGLE
        ----------------------------------------------------------------
        set("n", "<C-q>", mc.toggleCursor, { desc = "Toggle Cursor", })

        -- MULTICURSOR MODE KEYMAPS
        ----------------------------------------------------------------
        -- DX: additional additions if needed
        --
        -- set("x", "<C-n>", function() mc.matchAddCursor(1) end, { desc = "Add Cursor Next Match" }) -- -- Add next match
        -- set("x", "<C-q>", function() mc.matchSkipCursor(1) end, { desc = "Skip Next Match" }) -- Skip next match
        -- set({ "n", "x" }, "<C-j>", function() mc.lineAddCursor(1) end, { desc = "Add Cursor Below" }) -- Add cursor below
        -- set({ "n", "x" }, "<C-k>", function() mc.lineAddCursor(-1) end, { desc = "Add Cursor Above" }) -- Add cursor above
        -- set("n", "<C-q>", mc.toggleCursor, { desc = "Toggle Cursor", }) -- Manual cursor toggle

        mc.addKeymapLayer(function(layerSet)

            -- Switch main cursor
            layerSet({ "n", "x" }, "<left>", mc.prevCursor)
            layerSet({ "n", "x" }, "<right>", mc.nextCursor)

            layerSet({ "n", "x" }, "<C-x>", mc.deleteCursor) -- Delete current cursor

            -- Clear cursors
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)

        ----------------------------------------------------------------
        -- HIGHLIGHTS
        ----------------------------------------------------------------

        local hl = vim.api.nvim_set_hl

        hl(0, "MultiCursorCursor", { reverse = true })
        hl(0, "MultiCursorVisual", { link = "Visual" })
        hl(0, "MultiCursorSign", { link = "SignColumn" })
        hl(0, "MultiCursorMatchPreview", { link = "Search" })

        hl(0, "MultiCursorDisabledCursor", { reverse = true })
        hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
        hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
    end,
}

--Y: USAGE: ---------------------------------
--# Visual MODE
--     SELECT
--        ctrl + n 
--        alt + n 
--      SKIPT
--        ctlr + q 
--        alt + q
--# NORMAL + VISUAL MODE 
--    ctro + j, k  add cursors up down
--# Normal mode
--    Ctrl + q  = Add random cursors
---------------------------------------------


  -- TEST: 
--
  -- hl(0, "MultiCursorCursor", { reverse = true })
  -- hl(0, "MultiCursorVisual", { link = "Visual" })
  -- hl(0, "MultiCursorSign", { link = "SignColumn" })
  -- hl(0, "MultiCursorMatchPreview", { link = "Search" })
  --
  -- hl(0, "MultiCursorDisabledCursor", { reverse = true })
  -- hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
  -- hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
