require("git-worktree").setup({})

require("git-worktree").on_tree_change(function(op, metadata)
    print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
    if op == Worktree.Operations.Switch then end
end)

require("telescope").extensions.git_worktree.create_git_worktree()
