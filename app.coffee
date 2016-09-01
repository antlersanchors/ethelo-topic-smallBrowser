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

# Scrolling for the side nav
navScroll = new ScrollComponent
	x: -1200
	y: 24
	height: 1754
	width: 1200
	scrollHorizontal: false
	mouseWheelEnabled: true

navScroll.content.draggable.overdrag = false

navScroll.states.add
	open:
		x:0
	closed:
		x: -1200

navScroll.states.animationOptions =
	curve: "ease-in-out"
	time: .5

# SIDE DRAWER NAVIGATION
sideNavDrawer.x = -1200
sideNavDrawer.parent = navScroll.content

sideNavDrawer.states.add
	open:
		x: 0
	closed:
		x: -1200

sideNavDrawer.states.animationOptions =
	curve: "ease-in-out"
	time: .2



# Here is an invisible hitbox for the Navigation Menu hamburger button
buttonNav = new Layer
	y: 72
	x: 0
	width: 182
	height: 168
# 	opacity: 0

# We'll toggle the hitbox’s position so that it can be used for the menu’s close button, as well
buttonNav.states.add
	open:
		x: Screen.width - 182
	closed:
		x: 0

buttonNav.states.animationOptions =
	time: 0

# TOGGLE THE SIDE DRAWER NAVIGATION
buttonNav.onClick ->
	sideNavDrawer.states.next()
	buttonNav.states.next()
	navScroll.states.next()


 

 



