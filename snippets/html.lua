--- @diagnostic disable: undefined-global

local html = [[
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="{}">
    <link rel="icon" type="image/x-icon" href="{}">
    <link rel="stylesheet" href="{}">
    <title>{}</title>
  </head>
  <body>
    {}
  </body>
</html>
]]

return {
  s(
    "!",
    fmt(html, {
      i(1),
      i(2, "favicon.ico"),
      i(3, "style.css"),
      i(4),
      i(5),
    })
  ),
  s(
    "scr",
    fmt('<script src="{}"></script>', {
      i(1, "script.js"),
    })
  ),
}
