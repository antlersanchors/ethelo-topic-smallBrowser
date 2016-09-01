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

bg = new BackgroundLayer
	backgroundColor: Color.gray(0.91)

contentScroll = new ScrollComponent
	width: 1100
	height: 1274
	scrollHorizontal: false
	mouseWheelEnabled: true
	y: 357
	contentInset:
		top: -357

contentScroll.content.draggable.overdragScale = 0.01 

# Main content
scrollableContent.superLayer = contentScroll.content

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
sideNavDrawer.superLayer = navScroll.content
sideNavDrawer.index = 99
sideNavDrawer.visible = true

sideNavDrawer.states.add
	open:
		x: 0
	closed:
		x: -1200

sideNavDrawer.states.animationOptions =
	curve: "ease-in-out"
	time: .4

# BRING THINGS TO THE FRONT
fab_collapsed.parent = null
FAB_Expanded_with_Scrim.parent = null
SYSTEM_topBar.parent = null
SYSTEM_bottomBar.parent = null
headerBar.parent = null
progressBar.parent = null
breadcrumbBar.parent = null
bottomNavBar.parent = null

navScroll.bringToFront()

FAB_Expanded_with_Scrim.states.add
	closed:
		visible: false
	open:
		visible: true

FAB_Expanded_with_Scrim.states.switch("open", curve: "ease-in-out", time: .2)
FAB_Expanded_with_Scrim.states.switch("closed", curve:"ease-in-out", time: .2)

fab_collapsed.onClick ->
	FAB_Expanded_with_Scrim.states.next()

FAB_Expanded_with_Scrim.onClick ->
	FAB_Expanded_with_Scrim.states.switch("closed")

# BUTTONNAV: I GO LAST
# Here is an invisible hitbox for the Navigation Menu hamburger button
buttonNav = new Layer
	y: 72
	x: 0
	width: 182
	height: 168
	opacity: 0

# We'll toggle the hitbox’s position so that it can be used for the menu’s close button, as well
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
	navScroll.states.next()

