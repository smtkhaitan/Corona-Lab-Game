-----------------------------------------------------------------------------------------
--
-- level4.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

-- include Corona's "physics" library
local physics = require "physics"
physics.start();
physics.setGravity(0,0.8)
--------------------------------------------

physics.setDrawMode("normal")
system.activate("multitouch");

_H = display.contentHeight;
_W = display.contentWidth;

---------------------------------------------------
--variable declarations

 myBalloon=nil;
 balloons = 0;
 burst=0;
 numBalloons = 80;
 startTime = 10;
 totalTime = 10;
 timeLeft = true;
 playerReady = false;
 Random = math.random;
 screenText=nil
 timeText=nil
 music = audio.loadStream("music.mp3");
 balloonPop = audio.loadSound("balloonPop.mp3");

------------------------------------------------------------------

function removeBalloons(obj)
	obj:removeSelf();
	balloons = balloons -1;
	burst = burst+1;
	screenText.text = "Score: "..burst;
	screenText.xScale = 0.7
	screenText.yScale = 0.7;
	screenText.x = _W / 2+180;
	screenText.y = _H - 300;
 
end
-------------------------------------------------------------------

function countDown(event)
	
	if (startTime == totalTime) then
		playerReady = true;
	end
	
	startTime = startTime - 1;
	timeText.text = "Time: "..startTime;
 
	if (startTime <=0) then
		timeLeft = false
	end
	
	if(timeLeft== false )then
		numBalloons=0
		composer.removeScene( "lvl1")
		local options = { effect = "crossFade", time = 400 ,params = { score = tostring(burst) } }
		if(burst >= 40)then
			composer.gotoScene( "lvl5", options)
		else
			composer.gotoScene( "gameover", options)
		end
	end 
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	
function scene:create( event )

	local sceneGroup = self.view
	local background = display.newImage( "back.png" ,240,160)
	sceneGroup:insert( background )
	
	x = display.newText("Level 4" , 80 , 20,native.systemFontBold,30);
	sceneGroup:insert(x);
	timeText = display.newText("Time: "..startTime, 50,280, native.systemFont, 16*2);
	timeText.xScale = 0.7;
	timeText.yScale = 0.7;
	timeText.x = _W / 2 - 190;
	timeText.y = _H - 30;
	sceneGroup:insert( timeText )


	screenText = display.newText("Loading Balloons.....", 0, 0, native.systemFont, 16*2);
	screenText.xScale = 0.5
	screenText.yScale = 0.5;
	screenText.x = _W / 2 - 160;
	screenText.y = _H - 300
	sceneGroup:insert( screenText )
	
	local leftWall = display.newRect (0, 0, 1, display.contentHeight+300);
	sceneGroup:insert( leftWall )
	local rightWall = display.newRect (display.contentWidth, 0, 1, display.contentHeight+300);
	sceneGroup:insert( rightWall )
	local ceiling = display.newRect (0, 0, display.contentWidth+500, 1);
	sceneGroup:insert( ceiling )
	local floor1 = display.newRect (100, 320, display.contentWidth+300,20);
	sceneGroup:insert( floor1 )
	floor1:setFillColor(0.1,0.4, 0.2 )
 
 
	physics.addBody (leftWall, "static",  { bounce = 0.1 } );
	physics.addBody (rightWall, "static", { bounce = 0.1 } );
	physics.addBody (ceiling, "static",   { bounce = 0.1 } );
	physics.addBody (floor1, "static",   { bounce = 1.5 } );
	

	
	for i= numBalloons,1,-1
	do
		ax = Random(7);
		
		if(ax==0)then
			myBalloon = display.newImageRect("balloon.png", 40, 40);
		end
	
		if(ax==1) then
			myBalloon = display.newImageRect("balloon1.png", 40, 40);
		end
		
		if(ax==2)then
			myBalloon = display.newImageRect("balloon@2x.png",40, 40);
		end
		
		if(ax==3)then
			myBalloon = display.newImageRect("balloon3.png", 40, 40);
		end
		
		if(ax==4)then
			myBalloon = display.newImageRect("balloon7.png", 40, 40);
		end
		
		if(ax==5)then
			myBalloon = display.newImageRect("balloon5.png",40, 40);
		end
		
		if(ax==6)then
			myBalloon = display.newImageRect("balloon6.png",40, 40);
		end
		
		if(ax==7)then
			myBalloon = display.newImageRect("balloon@2x.png",40, 40);
		end
	
	
		myBalloon.x = Random(10,_W);
		myBalloon.y = _H-300;
		
		physics.addBody(myBalloon, "dynamic", {density=0.1, friction=0, bounce=0.9, radius=10});
		
			function myBalloon:touch(e)
		if (timeLeft ~= false) then
			if (playerReady == true) then
				if (e.phase == "ended") then
					audio.play(balloonPop);
					removeBalloons(self);
				end
			end
		end
	end
	
	
		balloons = balloons + 1;
		myBalloon:addEventListener("touch", myBalloon);
		sceneGroup:insert(myBalloon)
	end
	
	
	if (balloons == numBalloons) then
		screenText.text = "Score: "..burst;
		screenText.xScale = 0.7
		screenText.yScale = 0.7;
		screenText.x = _W / 2+180;
		screenText.y = _H - 300;
		gameTimer = timer.performWithDelay(1000, countDown, totalTime);
	else
		playerReady = false;
	end
    
	gameTimer = timer.performWithDelay(50, startGame, numBalloons);
end


function scene:show(event)

	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		audio.play(music);
		
	elseif phase == "did" then
		--audio.play(music);
		physics.start();
		physics.setGravity(0,0.8);
	end
end


function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		physics.stop()
	elseif phase == "did" then
		audio.stop(music);
	end	
	
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------
return scene