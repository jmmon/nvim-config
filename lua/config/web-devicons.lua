local icons_status_ok, icons = pcall(require, "nvim-web-devicons")
if not  icons_status_ok then
  return
end



icons.setup {
 override_by_extension = {
  ["log"] = {
    --icon = "",
    icon = "",
    color = "#72A0C1",
    name = "Log"
  },
  ["txt"] = {
    --icon = "",
    icon = "",
    color = "#F0F8FF",
    name = "Text"
  },
  ["svg"] = {
    --icon = "",
    icon = "",
    color = "#4444FF",
    name = "SVG"
  },
  ["xml"] = {
    --icon = "",
    icon = "",
    color = "#FFA500",
    name = "XML"
  }
 };
}
