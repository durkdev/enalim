package main

import (
	"flag"

	"github.com/uzudil/isongn/top"
)

func main() {
	winWidth := flag.Int("width", 1200, "Window width (default: 1200)")
	winHeight := flag.Int("height", 900, "Window height (default: 900)")
	fps := flag.Float64("fps", 60, "Frames per second")
	fs := flag.Bool("fullscreen", false, "Fullscreen mode?")
	flag.Parse()

	top.Start("runner", ".", *winWidth, *winHeight, *fps, *fs)
}
