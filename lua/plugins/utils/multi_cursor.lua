return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",

    config = function()
        local mc = require("multicursor-nvim")
        local wk = require("which-key")

        mc.setup()
        local set = vim.keymap.set

        ----------------------------------------------------------------
        -- WHICH-KEY GROUP
        ----------------------------------------------------------------
        wk.add({ { "<leader>m", group = "Multicursor", icon = "🌀" }, })

        ----------------------------------------------------------------
        -- ADD CURSORS LINEWISE
        ----------------------------------------------------------------
        set({ "n", "x" }, "<leader>mk", function() mc.lineAddCursor(-1) end, { desc = "Add Cursor Above" }) -- Add cursor above
        set({ "n", "x" }, "<leader>mj", function() mc.lineAddCursor(1) end, { desc = "Add Cursor Below" }) -- Add cursor below
        set({ "n", "x" }, "<leader>mK", function() mc.lineSkipCursor(-1) end, { desc = "Skip Cursor Above" }) -- Skip line above
        set({ "n", "x" }, "<leader>mJ", function() mc.lineSkipCursor(1) end, { desc = "Skip Cursor Below" }) -- Skip line below
        ----------------------------------------------------------------
        -- MATCH CURSORS
        ----------------------------------------------------------------
        set({ "n", "x" }, "<leader>mn", function() mc.matchAddCursor(1) end, { desc = "Add Cursor Next Match" }) -- Add next match
        set({ "n", "x" }, "<leader>ms", function() mc.matchSkipCursor(1) end, { desc = "Skip Next Match" }) -- Skip next match
        set({ "n", "x" }, "<leader>mN", function() mc.matchAddCursor(-1) end, { desc = "Add Cursor Previous Match" }) -- Add previous match
        set({ "n", "x" }, "<leader>mS", function() mc.matchSkipCursor(-1) end, { desc = "Skip Previous Match" }) -- Skip previous match
        ----------------------------------------------------------------
        -- TOGGLE CURSORS
        ----------------------------------------------------------------
        set({ "n", "x" }, "<c-q>", mc.toggleCursor, { desc = "Toggle Cursor", })
        ----------------------------------------------------------------
        -- MOUSE SUPPORT
        ----------------------------------------------------------------
        set("n", "<c-leftmouse>", mc.handleMouse, { desc = "Add Cursor Mouse", })
        set("n", "<c-leftdrag>", mc.handleMouseDrag, { desc = "Drag Multi Cursor", })
        set("n", "<c-leftrelease>", mc.handleMouseRelease, { desc = "Release Multi Cursor", })
        ----------------------------------------------------------------
        -- MULTICURSOR-ONLY KEYMAPS
        ----------------------------------------------------------------

        mc.addKeymapLayer(function(layerSet)

            layerSet({ "n", "x" }, "<left>", mc.prevCursor) -- Previous cursor
            layerSet({ "n", "x" }, "<right>", mc.nextCursor) -- Next cursor
            layerSet({ "n", "x" }, "<leader>mx", mc.deleteCursor) -- Delete current cursor

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

-- Y: USAGE: 
-- ----------------------
-- <leader>m 󰗧 Multicursor
-- ----------------------
-- ├── mj  Add Cursor Below
-- ├── mk  Add Cursor Above
-- ----------------------
-- ├── mJ  Skip Cursor Below
-- ├── mK  Skip Cursor Above
-- ----------------------
-- ├── mn  Add Cursor Next Match
-- ├── ms  Skip Next Match
-- ----------------------
-- ├── mN  Add Cursor Previous Match
-- ├── mS  Skip Previous Match
-- ----------------------
-- └── mx  Delete Cursor

