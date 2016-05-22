
local composer = require( "composer" )
local scene = composer.newScene()

local widget = require "widget"

local playBtn

local function onPlayBtnRelease()

	composer.removeScene( "gameover" )
	composer.gotoScene( "lvl1", "fade", 500 )
	
	return true
end

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImageRect( "gover.jpg", display.contentWidth, display.contentHeight )
	background.anchorX = 0
	background.anchorY = 0
	
	playBtn = widget.newButton{
		--label="Play Again",
		labelColor = { default={ 1,1,1 }, over={ 1 , 0.3 , 0.3 } },
		defaultFile="play_button.png",
		fontSize=20,
		overFile="play_button.png",
		width=154, height=40,
		onRelease = onPlayBtnRelease	-- event listener function
	}
	playBtn.x = display.contentWidth*0.5
	playBtn.y = display.contentHeight - 30
	
	local xyz = "Score : " .. event.params.score

	local scoreText = display.newText( xyz, display.contentWidth * 0.5 , 250, native.systemFont, 14 )
	scoreText:setFillColor( 1, 1, 1 )
	scoreText.xScale = 1.6;
	scoreText.yScale = 2;
	
	scoreText.x = display.contentWidth*0.48
	scoreText.y = display.contentHeight-270
	scoreText:setTextColor(0,0,0);
	

	
	sceneGroup:insert( background )
	sceneGroup:insert( playBtn )
	sceneGroup:insert( scoreText )

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		
	elseif phase == "did" then
	
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then

	elseif phase == "did" then
	
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	if playBtn then
		playBtn:removeSelf()
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene