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
local platform = getInfo( "platformVersion" );
local font = (platform ~= "Android") and "Helvetica-Light" or system.nativeFont;

--font  // http://iosfonts.com
local foo = display.newText( "Hello", 0 , 0 , font , 32);
font:setTextColor( 0, 0, 0 );
font:setReferencePoint( CenterReferencePoint );
font.x = _W * 0.5;
font.y = _H * 0.5;

--Background  (white color)
local background_color = newRect( 0, 0, 320, 480 );
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
display.loadRemoteImage( "http://theme5hq.com/wp-content/uploads/2014/01/itune-01.jpg", "GET", loadImage , "temp" ,system.TemporaryDirectory ,0,0);

--Group
local group1 = display.newGroup( );
local bar = display.newText("bar",0,0,system.nativefont,32);
bar:setTextColor( 0, 0, 0  );
group1.insert(reloadImage);
group1.insert(bar);
reloadImage.x = _W * 0.5;
reloadImage.y = _H * 0.5;
bar.x = reloadImage.x;
bar.y = reloadImage.y;
group1.x = _W * 0.5;
group1.y = _H * 0.5;

-- background green with Mask
local mask = graphics.newMask("assets/img/mask.png");
local bg_green = display.newImageRect( "assets/img/bg-green.png", 320, 480 );
bg_green.x = _W * 0.5;
bg_green.y = _H * 0.5;
bg_green:setMask( mask );

-- getinfo texture memory
local texturememory_used = system.getInfo( "texturememory" );
texturememory_used = texturememory_used/1024/1024 ;
print("texture memory used : " .. texturememory_used);
local Maxtexture = system.getInfo( "Maxtexture" );
print("Maxtexture memory : " .. Maxtexture);

--Release Memory
--[[
example::

bar.removeSelf;
bar = nil;

]]






