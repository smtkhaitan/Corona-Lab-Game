display.setStatusBar( display.HiddenStatusBar )
local composer = require "composer"
local scene = composer.newScene()

local startTime

local scenegroup

local function go()
  	local td = os.difftime(os.time(),startTime)
  	if td > 2 then
  		composer.gotoScene("menu");
  	end
end
 
 function scene:create(event)
   scenegroup = self.view

		background = display.newImageRect( "front_final.jpg", display.contentWidth, display.contentHeight )
	--background.anchorX = 0
	--background.anchorY = 0
	background.x, background.y = 240, 160

		x = display.newText("Developed By -" , 350 , 120,native.systemFontBold,25);
		y = display.newText("Satish Kumar" , 345 , 170,native.systemFontBold,20);
		z = display.newText("Shubham Chandra " , 370 , 200,native.systemFontBold,20);
        a = display.newText("Sumit Khaitan" , 345 , 230,native.systemFontBold,20);
		b = display.newText("Zuhaib Mohammed" , 365 , 260,native.systemFontBold,20);
         
		x:setTextColor(0,0,0);
        y:setTextColor(0,0,0);
        z:setTextColor(0,0,0);
        a:setTextColor(0,0,0);
		b:setTextColor(0,0,0);
		
 	    local titleLogo = display.newImageRect( "logo_front.png", 300, 250 )
	    titleLogo.x = display.contentWidth * 0.25
	    titleLogo.y = 140
		   
		  scenegroup:insert( background )
         scenegroup:insert(x)
         scenegroup:insert(y)
         scenegroup:insert(z)
         scenegroup:insert(a)
		 scenegroup:insert(b)
         scenegroup:insert(titleLogo)

         startTime = os.time();

   timer.performWithDelay(4000,go,1)
     
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