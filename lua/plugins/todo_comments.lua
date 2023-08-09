local status_ok, todo_comments = pcall(require, "todo-comments")

if not status_ok then
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
