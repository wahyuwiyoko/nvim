local setup, todo_comments = pcall(require, "todo-comments")

if not setup then
  return
end

todo_comments.setup({
  signs = false,
  keywords = {
    FIX = { icon = "" },
    TODO = { icon = "" },
    HACK = { icon = "" },
    WARN = { icon = "" },
    PERF = { icon = "" },
    NOTE = { icon = "" },
    TEST = { icon = "" }
  }
})
