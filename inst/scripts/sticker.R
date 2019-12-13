library("hexSticker")

img <- "https://svgsilh.com/png-1024/1674853-795548.png"

hexSticker::sticker(
  subplot  = img,
  package  = "pkgmin",
  p_size   = 8,
  p_color  = "#7a5549",
  p_family = "sans",
  p_x      = 1.00,
  p_y      = 1.35,
  s_x      = 1.00,
  s_y      = 0.75,
  s_width  = 0.60,
  s_height = 0.10,
  h_fill   = "#649d3c",
  h_color  = "#7a5549",
  filename = "inst/figures/pkgmin.png",
  asp      = 1.0,
  dpi      = 300
)
