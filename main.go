package main

import (
	"fyne.io/fyne/v2"
	"fyne.io/fyne/v2/app"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/widget"
)

const WindowName = "VFS"

func main() {
	a := app.New()
	w := a.NewWindow(WindowName)
	w.Resize(fyne.NewSize(700, 450))

	output := widget.NewMultiLineEntry()
	output.Disable()

	input := widget.NewEntry()
	input.SetPlaceHolder("Enter command here...")

	content := container.NewBorder(nil, input, nil, nil, container.NewScroll(output))
	w.SetContent(content)
	w.ShowAndRun()
}
