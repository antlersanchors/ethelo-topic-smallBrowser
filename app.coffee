# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Michael-Owen Liston"
	twitter: ""
	description: ""


# Import file "Ethelo Topic Page Prototypes-Small Browser v1" (sizes and positions are scaled 1:3)
sketch = Framer.Importer.load("imported/Ethelo Topic Page Prototypes-Small Browser v1@3x")

Utils.globalLayers(sketch)

sideNavDrawer.states.add
	closed:
		x: -1200
	
	open:
		x: 0

sideNavDrawer.states.switch("closed")

sideNavButton = new Layer
	y: 72
	width: 182
	height: 168



