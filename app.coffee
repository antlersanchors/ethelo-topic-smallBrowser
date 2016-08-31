# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Michael-Owen Liston"
	twitter: ""
	description: ""


# Import file "Ethelo Topic Page Prototypes-Small Browser v1 no artboard" (sizes and positions are scaled 1:3)
sketch = Framer.Importer.load("imported/Ethelo Topic Page Prototypes-Small Browser v1 no artboard@3x")

Utils.globalLayers(sketch)

sideNavDrawer.states.add
	open:
		x: 0
	closed:
		x: -1200

sideNavDrawer.states.animationOptions =
	curve: "ease-in-out"
	time: .4

buttonNav = new Layer
	y: 72
	x: 0
	width: 182
	height: 168

buttonNav.states.add
	closed:
		x: 900
	open:
		x: 0

buttonNav.states.animationOptions =
	time: 0

buttonNav.onClick ->
	sideNavDrawer.states.next()
	buttonNav.states.next()


