display.setStatusBar( display.HiddenStatusBar )
local composer = require "composer"
local scene = composer.newScene()

local widget = require "widget"

  local scenegroup
 
local function onBackRelease()
  
  -- go to level1.lua scene
  composer.gotoScene( "menu")
  
  return true -- indicates successful touch
end

 function scene:create(event)
   scenegroup = self.view
   
    background = display.newImageRect( "inst_back.jpg", display.contentWidth, display.contentHeight )
	--background.anchorX = 0
	--background.anchorY = 0
	background.x, background.y = 240, 160
 

   x = display.newText("1. How To Play" , 120 , 20,native.systemFontBold,30);
   y = display.newText("Pop as many balloons possible in given time." , 225 , 60,native.systemFontBold,20);
   z = display.newText("For popping balloons you need to touch it. " , 220 , 90,native.systemFontBold,20);
   
   s = display.newText("2. Points Allocation " , 150 , 180,native.systemFontBold,30);
   t = display.newText("+1 for every ball0on popped " , 150 , 220,native.systemFontBold,20);
   
   
   
          x:setTextColor(0,0,0)
          y:setTextColor(1,0,0);
           z:setTextColor(1,0,0);
            
             s:setTextColor(0,0,0);
             t:setTextColor(1,0,0);
            
 	        
          Back = widget.newButton{
        
                labelColor = { default={ 1,1,1 }, over={ 1 , 0.3 , 0.3 } },
                defaultFile="back_button.png",
                overFile="back_button.png",
                width=120, height=40,
                onRelease = onBackRelease -- event listener function
			}
  
  Back.x = display.contentWidth * 0.2
  Back.y = display.contentHeight - 30

        
         scenegroup:insert( background )
         scenegroup:insert(x)
         scenegroup:insert(y)
         scenegroup:insert(z)

         scenegroup:insert(s)
         scenegroup:insert(Back)
         scenegroup:insert(t)
        
  end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
	
	if scenegroup then
		scenegroup:removeSelf()
	end
	if playBtn then
		playBtn:removeSelf()	-- widgets must be manually removed
		playBtn = nil
	end
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
 



return scene