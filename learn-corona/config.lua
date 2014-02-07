application = {
	content = {
		width = 320,
		height = 480, 
		scale = "letterBox",
		fps = 30,
		
		--[[
        imageSuffix = {
		    ["@2x"] = 2,
		}
		--]]
        --Declare imageSuffix
        -- Scale mode , not fit the width and Height exactly
        scale = "letterBox",
        imageSuffix = {
            ["@1-5x"] = 1.5, -- Various Android Phone
            ["@2x"] = 2, --Iphone 4+ , Ipod touch , Ipad1 , Ipad2
            ["@3x"] = 3, --Various Android tablets
            ["@4x"] = 4, --Ipad3+
        }
	},

    --[[
    -- Push notifications

    notification =
    {
        iphone =
        {
            types =
            {
                "badge", "sound", "alert", "newsstand"
            }
        }
    }
    --]]    
}
