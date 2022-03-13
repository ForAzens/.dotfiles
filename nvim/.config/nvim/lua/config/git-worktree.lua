require("git-worktree").setup({})

local Worktree = require("git-worktree")

Worktree.on_tree_change(function(op, metadata)
    print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
    if op == Worktree.Operations.Switch then end
end)

require("telescope").load_extension("git_worktree")
