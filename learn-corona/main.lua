-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Project         : SaveMonster
-- AUTHOR          : EAKKASIT TUNSAKOOL
-- Version control : Github  (julongdragon@gmail.com)
-- Version         : 1.0
-- Date            : 7/2/2014
-----------------------------------------------------------------------------------------

-- Declare the visible width and height of screen
_W = display.viewableContentWidth
_H = display.viewableContentHeight

-- platformVersion
local platform = system.getInfo( "platformVersion" );
local font = (platform ~= "Android") and "Helvetica-Light" or system.nativeFont;

--font  // http://iosfonts.com
local foo = display.newText( "Hello", 0 , 0 , font , 32);
foo:setTextColor( 89,89,89);
foo.anchorX = 0;
foo.x = _W * 0.5;
foo.y = _H * 0.5;

--Background  (white color)
local background_color = display.newRect( 0, 0, 320, 480 );
background_color:setFillColor( 255 , 255 , 255 );

--Image
local reloadImage;
local function loadImage(e)
	if(e.isError) then
		-- There is an error
		print(error);
	else
		reloadImage = e.target;
		reloadImage.alpha = 0;
		reloadImage.x = _W * 0.5;
		reloadImage.y = _H * 0.5;
		transition.to( reloadImage, {alpha = 1} );
	end
end
--loadRemoteImage( url, method, listener [, params], destFilename [, baseDir] [, x, y] )
--[[local loadimage_fromUrl = display.loadRemoteImage( "http://theme5hq.com/wp-content/uploads/2014/01/itune-01.jpg", "GET", loadImage , "temp" ,system.TemporaryDirectory ,0,0);
loadimage_fromUrl = removeSelf;
loadimage_fromUrl = nil;
]]

--Group
--[[
local g1 = display.newGroup( );
local bar = display.newText("bar",0,0,system.nativefont,32);
bar:setTextColor( 0, 0, 0);
g1.insert(loadimage_fromUrl)
g1:insert(bar)
loadimage_fromUrl.x = _W * 0.5;
loadimage_fromUrl.y = _H * 0.5;
bar.x = loadimage_fromUrl.x;
bar.y = loadimage_fromUrl.y;
group1.x = _W * 0.5;
group1.y = _H * 0.5;
]]
-- background green with Mask
local mask = graphics.newMask("assets/img/mask.png");
local bg_green = display.newImageRect( "assets/img/bg-green.png", 320, 480 );
bg_green.x = _W * 0.5;
bg_green.y = _H * 0.5;
bg_green:setMask( mask );

-- getinfo texture memory
local texturememory_used = system.getInfo( "textureMemoryUsed" );
texturememory_used = texturememory_used/1024/1024 ;
print("texture memory used : " .. texturememory_used);
local Maxtexture = system.getInfo( "maxTextureSize" );
print("Maxtexture memory : " .. Maxtexture);

--Release Memory
--[[
example::

bar.removeSelf;
bar = nil;

]]

-- captureScreenShort
--local screenShort = display.captureScreen(true);

--addEventListener
local bar = display.newText("EAKKASIT",200,100,system.nativefont,32);
function bar:touch(event)
	if (event.phase == "began")then
		display.getCurrentStage():setFocus( self )
        self.isFocus = true
		print("touch began");
	elseif self.isFocus  then
		if(event.phase == "moved") then
		print("touch moved");
		elseif (event.phase == "ended") or (event.phase == "cancled") then
		display.getCurrentStage():setFocus( nil )
        self.isFocus = false
		print("touch ended");
		end
	end
	return true;
end

bar:addEventListener("touch",bar);

--foo touch
function foo:touch(event)
	if(event.phase == "began") then
		display.getCurrentStage():setFocus(self)
		self.isFocus = true;
		print("foo touch");
		elseif self.isFocus then
			if (event.phase == "moved") then
				print("foo move");
			--end
			elseif (event.phase == "ended") or (event.phase == "cancled") then
			display.getCurrentStage():setFocus( false)
			self.isFocus = false;
			print("foo end");
			--end
		end
	end
	return true;
end
foo:addEventListener("touch",foo);
-- Rotation
--[[
local fooa = display.newText( "Hello", 100 , 300 , system.nativeFont , 32);
local i = 0;
local n;
local PI = math.pi;
local function rotation(event)
	i = i + 1;
	print("i increase" ,i);
	n = ( i/360 ) * ( 2 * PI );
	print("n 360",n);
	n = math.cos(n);
	print("n cos",n)
	fooa.x = fooa.x + n;
	print("foo x");
	fooa.rotation = i % 360;
	fooa.xScale = n * 2;
	fooa.yScale = n * 2;
	
end
Runtime:addEventListener("enterFrame",rotation);]]






