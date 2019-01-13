class 'Squares'

local x = Render.Width
local y = Render.Height - 55
local C = 0
local C2 = 0
local Dump = True
local Dump2 = True
local speed = 1

function Squares:__init()
	Events:Subscribe( "Render" , self , self.Draw )
	Events:Subscribe( "PreTick" , self , self.Moving )
	Events:Subscribe( "ModulesLoad", self, self.ModulesLoad )
	Events:Subscribe( "ModuleUnload", self, self.ModuleUnload )
end

function Squares:Draw()
	local TextX = x + C
	local TextX2 = x + C2
	local PosX1 = Vector2( TextX , y )
	local PosX2 = Vector2( TextX2 , y )
	Render:FillArea( PosX1 , Vector2(50,50) , Color(75,75,255) )
	Render:FillArea( PosX2 , Vector2(50,50) , Color(75,75,255) )
	Render:DrawText( Vector2(TextX+5,y+5) , "Drum" , Color(75,255,75) )
	Render:DrawText( Vector2(TextX2+5,y+30) , "Box" , Color(75,255,75) )
end

function Squares:Moving()
-------------------------------
	if x+C >= x-100 then
		Dump = false
	elseif x+C <= 0 then
		Dump = true
	end

	if 	   Dump == true then
		C = C + speed
	elseif Dump == false then
		C = C - speed
	end
-------------------------------
	if x+C2 >= x-50 then
		Dump2 = false
	elseif x+C2 <= 50 then
		Dump2 = true
	end

	if 	   Dump2 == true then
		C2 = C2 + speed
	elseif Dump2 == false then
		C2 = C2 - speed
	end
-------------------------------
end

function Squares:ModulesLoad()
    Events:Fire( "HelpAddItem",
        {
            name = "Moving Squares",
            text = "Этот скрипт никого не унижает\n"..
            		 "не оскарбляет и не предназначен,\n"..
            		  "для какой-либо травли."
        } )
end

function Squares:ModuleUnload()
    Events:Fire( "HelpRemoveItem",
        {
            name = "Moving Squares"
        } )
end

squares = Squares()