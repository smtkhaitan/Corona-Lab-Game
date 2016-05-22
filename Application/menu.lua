-----------------------------------------------------------------------------------------
--
-- menu.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene= composer.newScene()

-- include Corona's "widget" library
local widget = require "widget"

--------------------------------------------------------------------------------------

-- forward declarations and other locals
local playBtn

-- 'onRelease' event listener for playBtn
local function onPlayBtnRelease()
	
	-- go to level1.lua scene
	composer.gotoScene( "lvl1", "fade", 500 )
	
	return true	-- indicates successful touch
end


local function onPlayBtnRelease1()
	
	-- go to level1.lua scene
	composer.gotoScene( "inst", "fade", 500 )
	
	return true	-- indicates successful touch
end

local function onPlayBtnRelease2()
	
	-- go to level1.lua scene
	composer.gotoScene( "score", "fade", 500 )
	
	return true	-- indicates successful touch
end

function scene:create( event )

	local sceneGroup = self.view
	local background = display.newImageRect( "no_box.jpg", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	background.x, background.y = 0, 0
	
	
	
	-- create a widget button (which will loads level1.lua on release)
	playBtn = widget.newButton{
		--label="Play",
		labelColor = { default={ 1,1,1 }, over={ 1 , 0.3 , 0.3 } },
		defaultFile="play.png",
		fontSize=20,
		overFile="play.png",
		width=120, height=40,
		onRelease = onPlayBtnRelease	-- event listener function
	}
	playBtn.x = display.contentWidth*0.8
	playBtn.y = display.contentHeight - 30
	
	
	
	
		-- create a widget button (which will loads level1.lua on release)
	instBtn = widget.newButton{
		--label="Play",
		labelColor = { default={ 1,1,1 }, over={ 1 , 0.3 , 0.3 } },
		defaultFile="inst.png",
		fontSize=20,
		overFile="inst.png",
		width=154, height=40,
		onRelease = onPlayBtnRelease1	-- event listener function
	}
	instBtn.x = display.contentWidth*0.3
	instBtn.y = display.contentHeight - 30
	
	

	scoreBtn = widget.newButton{
		--label="Play",
		labelColor = { default={ 1,1,1 }, over={ 1 , 0.3 , 0.3 } },
		defaultFile="Highscores.png",
		fontSize=20,
		overFile="Highscores.png",
		width=154, height=40,
		onRelease = onPlayBtnRelease2	-- event listener function
	}
	scoreBtn.x = display.contentWidth*0.5
	scoreBtn.y = display.contentHeight - 220
	
	-- all display objects must be inserted into group
	sceneGroup:insert( background )
	
	sceneGroup:insert( playBtn )
	sceneGroup:insert( instBtn )
	sceneGroup:insert( scoreBtn )
end


---------------------------------------------------------------------------------
-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene