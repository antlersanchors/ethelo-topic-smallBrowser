# Project Info
# This info is presented in a widget when you share.
# http://framerjs.com/docs/#info.info

Framer.Info =
	title: ""
	author: "Michael-Owen Liston"
	twitter: ""
	description: ""


# Import file "Ethelo Topic Page Prototypes-Small Browser v2 no artboard" (sizes and positions are scaled 1:3)
sketch = Framer.Importer.load("imported/Ethelo Topic Page Prototypes-Small Browser v2 no artboard@3x")

Utils.globalLayers(sketch)

bg = new BackgroundLayer
	backgroundColor: Color.gray(0.9)

# Janky realignment because it layers are mysteriously off
nudge = [
	bottomNavBar
	progressBar
	headerBar
	SYSTEM_topBar
	SYSTEM_bottomBar
]

for layer in nudge
	layer.props =
		x: -1

bottomNavBar.x = -10

##########################
# MAIN CONTENT SCROLLING #
contentScroll = new ScrollComponent
	width: 1100
	height: 1379
	scrollHorizontal: false
	mouseWheelEnabled: true
	y: 252
	contentInset:
		top: -250

contentScroll.content.draggable.overdragScale = 0.01 

scrollableContent.superLayer = contentScroll.content

######################
# SIDE NAV SCROLLING #
navScroll = new ScrollComponent
	x: -1200
	y: 24
	height: 1754
	width: 1200
	scrollHorizontal: false
	mouseWheelEnabled: true

navScroll.content.draggable.overdrag = false

# We need to move both the side nav and it’s scrollContainer parent?
navScroll.states.add
	open:
		x:0
	closed:
		x: -1200

navScroll.states.animationOptions =
	curve: "ease-in-out"
	time: .5

#################################
# SIDE DRAWER NAVIGATION ACTUAL #
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
	time: .5

# BRING ALL THE OTHER THINGS TO THE FRONT
fab_collapsed.parent = null
FAB_Expanded_with_Scrim.parent = null
SYSTEM_topBar.parent = null
SYSTEM_bottomBar.parent = null
headerBar.parent = null
progressBar.parent = null
bottomNavBar.parent = null
accountOrgDecisionsMenu.parent = null

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
# buttonNav = new Layer
# 	y: 72
# 	x: 0
# 	width: 182
# 	height: 168
# 	opacity: 0
# 
# # We'll toggle the hitbox’s position so that it can be used for the menu’s close button, as well
# buttonNav.states.add
# 	closed:
# 		x: 900
# 	open:
# 		x: 0
# 
# buttonNav.states.animationOptions =
# 	time: 0
# 
# buttonNav.onClick ->
# 	sideNavDrawer.states.next()
# 	buttonNav.states.next()
# 	navScroll.states.next()


# accountsButton = new Layer
# 	y: 286
# 	width: 182
# 	height: 168
# # 	opacity: 0
# 	x: 898

accountOrgDecisionsMenu.x = -1200
accountOrgDecisionsMenu.bringToFront()

accountOrgDecisionsMenu.states.add
	closed:
		x: -1200
		opacity: .7

	open:
		x: 0
		opacity: 1

sideNavOpenButton.onClick ->
		sideNavDrawer.states.switch("open", curve: "ease-in-out", time: .6)
		navScroll.states.switch("open", curve: "ease-in-out", time: .6)

closeSideNavButton.onClick ->
		sideNavDrawer.states.switch("closed", curve: "ease-in-out", time: .4)
		navScroll.states.switch("closed", curve: "ease-in-out", time: .4)

accountOverflowButton.onClick ->
	accountOrgDecisionsMenu.states.switch("open", curve: "ease-in-out", time: .4)

closeAccountMenuButton.onClick ->
	accountOrgDecisionsMenu.states.switch("closed", curve: "ease-in-out", time: .4)


# clickHandler = (event, layer) ->
# 	if sideNavDrawer.states.current == "open"
# 		accountOrgDecisionsMenu.states.switch("")
# 	
# accountsButton.on(Events.Click, clickHandler)
		