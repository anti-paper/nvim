-- ファイルアイコンの設定
require'nvim-web-devicons'.setup {
  override = {
    bash = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Bash"
    }
  };
  color_icons = true;
  default = true;
}
