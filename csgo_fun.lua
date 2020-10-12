--made by Puchi--

--Refs--
local csgo_fun_lua_ref = gui.Tab(gui.Reference("SETTINGS"), "lua_csgo_fun", "CS:GO Fun")
local toggle_ref = gui.Groupbox(csgo_fun_lua_ref, "Toggle", 16, 16, 296, 400)
local ragdoll_ref = gui.Groupbox(csgo_fun_lua_ref, "Ragdoll Fun Features", 328, 16, 296, 400)
local usefull_visual_ref = gui.Groupbox(csgo_fun_lua_ref, "Usefull Visual Features", 16, 189, 296, 400)
local visual_ref = gui.Groupbox(csgo_fun_lua_ref, "Visual Fun Featrues", 328, 288, 296, 400)


--Master Switch and sv_cheats Checkboxes and Descriptions--
local csgo_fun_toggle_checkbox = gui.Checkbox(toggle_ref, "csgo_fun_lua_master", "Enable", 0)
csgo_fun_toggle_checkbox:SetDescription("Enables CS:GO Fun features.")
local csgo_fun_svcheats_checkbox = gui.Checkbox(toggle_ref, "csgo_fun_lua_svcheats", "sv_cheats Bypass", 0)
csgo_fun_svcheats_checkbox:SetDescription("Toggles aimwares sv_cheats bypass.")


--Ragdoll Fun Feature Checkboxes and Descriptions--
local csgo_fun_ragdoll_feature1_checkbox = gui.Checkbox(ragdoll_ref, "csgo_fun_lua_ragdoll_feature1_box", "Ragdoll Gravity", 0)
csgo_fun_ragdoll_feature1_checkbox:SetDescription("Toggle ragdoll gravity modifier.")
local csgo_fun_ragdoll_feature1_slider = gui.Slider(ragdoll_ref, "csgo_fun_lua_ragdoll_feature1_slider", "Gravity Value", 600, -10000, 10000)
local csgo_fun_ragdoll_feature2_checkbox = gui.Checkbox(ragdoll_ref, "csgo_fun_lua_ragdoll_feature2_box", "Ragdoll Physics", 0)
csgo_fun_ragdoll_feature2_checkbox:SetDescription("Ragdoll physics speed.")
local csgo_fun_ragdoll_feature2_slider = gui.Slider(ragdoll_ref, "csgo_fun_lua_ragdoll_feature2_slider", "Speed Value", 1, 0.1, 2.0, 0.1)


--Usefull Visual Features Checkboxes and Descriptions--
local csgo_fun_usefull_visual_feature1_checkbox = gui.Checkbox(usefull_visual_ref, "csgo_fun_lua_usefull_visual_feature1_box", "Bullet Impacts", 0)
csgo_fun_usefull_visual_feature1_checkbox:SetDescription("Toggle bullet impacts")
local csgo_fun_usefull_visual_feature1_slider = gui.Slider(usefull_visual_ref, "csgo_fun_usefull_visual_feature1_slider", "Impact Mode", 1, 1, 3)
csgo_fun_usefull_visual_feature1_slider:SetDescription("Bullet impact modes")
local csgo_fun_usefull_visual_feature2_checkbox = gui.Checkbox(usefull_visual_ref, "csgo_fun_lua_usefull_visual_feature2_box", "Bullet Penetration Info", 0)
csgo_fun_usefull_visual_feature2_checkbox:SetDescription("Toggle bullet penetration info")
local csgo_fun_usefull_visual_feature3_checkbox = gui.Checkbox(usefull_visual_ref, "csgofun_lua_usefull_visual_feature3_box", "Show Map Triggers", 0)
csgo_fun_usefull_visual_feature3_checkbox:SetDescription("Show/Hide map triggers like bomb place areas")


--Visual Fun Features Checkboxes and Descriptions--
local csgo_fun_visual_feature1_checkbox = gui.Checkbox(visual_ref, "csgo_fun_lua_visual_feature1_box", "Fullbright", 0)
csgo_fun_visual_feature1_checkbox:SetDescription("Toggle fullbright")
local csgo_fun_visual_feature1_slider = gui.Slider(visual_ref, "csgo_fun_lua_visual_feature1_slider", "Fullbright Mode", 1, 0, 2)
csgo_fun_visual_feature1_slider:SetDescription("Fullbright mode (2 looks the best imo)")
local csgo_fun_visual_feature2_checkbox = gui.Checkbox(visual_ref, "csgo_fun_lua_visual_feature2_box", "LSD Mode", 0)
csgo_fun_visual_feature2_checkbox:SetDescription("Toggle LSD-like mode")
local csgo_fun_visual_feature3_checkbox = gui.Checkbox(visual_ref, "csgo_fun_lua_visual_feature3_box", "Weapon Flashlight", 0)
csgo_fun_visual_feature3_checkbox:SetDescription("Adds a L4D2 like flashlight (not very bright)")
local csgo_fun_visual_feature4_checkbox = gui.Checkbox(visual_ref, "csgo_fun_lua_visual_feature4_box", "Party Mode", 0)
csgo_fun_visual_feature4_checkbox:SetDescription("Tip: Enable and shoot a taser")
local csgo_fun_visual_feature5_checkbox = gui.Checkbox(visual_ref, "csgo_fun_lua_visual_feature5_box", "Viewmodel Sway", 0)
csgo_fun_visual_feature5_checkbox:SetDescription("Enable viewmodel sway modifier")
local csgo_fun_visual_feature5_slider = gui.Slider(visual_ref, "csgo_fun_lua_visual_feature5_slider", "Weapon Sway Amount", 1.6, 0, 1000, 0.5)
csgo_fun_visual_feature5_slider:SetDescription("Viewmodel sway scale")


csgo_fun_ragdoll_feature1_checkbox:SetDisabled(true)
csgo_fun_ragdoll_feature1_slider:SetDisabled(true)
csgo_fun_visual_feature3_checkbox:SetDisabled(true)



--The actual lua--
local function csgo_fun_master()

	if csgo_fun_toggle_checkbox:GetValue() then	--master switch check--
		csgo_fun_svcheats_checkbox:SetDisabled(false) --making sv_cheats clickable when the master switch is on--
		
		
			if csgo_fun_svcheats_checkbox:GetValue() then
				
					gui.SetValue("misc.bypasscheats", 1)	--Sets sv_cheats bypass (in Misc->General->Bypass) to 1 when the box is checked, but does not disable it when uncheck--
			
			end
			
			if csgo_fun_ragdoll_feature1_checkbox:GetValue() then
				
				client.SetConVar("cl_ragdoll_gravity", csgo_fun_ragdoll_feature1_slider:GetValue(), true)	--Ragdoll gravity default is 600--
				
			else
			
				client.SetConVar("cl_ragdoll_gravity", 600, true)
			
			end
			
			if csgo_fun_ragdoll_feature2_checkbox:GetValue() then
				
				client.SetConVar("cl_phys_timescale", csgo_fun_ragdoll_feature2_slider:GetValue(), true)					--Ragdoll simulation speed defaul is 1--
				
			else
			
				client.SetConVar("cl_phys_timescale", 1,true)
			
			end
			
			if csgo_fun_usefull_visual_feature1_checkbox:GetValue() then
			
					client.SetConVar("sv_showimpacts", csgo_fun_usefull_visual_feature1_slider:GetValue(), true)	--Bullet impact mode from 1-3 (1=client- and server-side; 2=only client-side; 3=only server-side)--
			else
			
					client.SetConVar("sv_showimpacts", 0, true)
			
			end
			
			if csgo_fun_usefull_visual_feature2_checkbox:GetValue() then
			
					client.SetConVar("sv_showimpacts_penetration", 1, true)
			else
			
					client.SetConVar("sv_showimpacts_penetration", 0, true)
			
			end
			
			if csgo_fun_usefull_visual_feature3_checkbox:GetValue() then
					
					client.SetConVar("showtriggers", 1, true)
			else
			
					client.SetConVar("showtriggers", 0, true)
			
			end
			
			if csgo_fun_visual_feature1_checkbox:GetValue() then
			
					client.SetConVar("mat_fullbright", csgo_fun_visual_feature1_slider:GetValue(), true)
			
			end
			
			if csgo_fun_visual_feature2_checkbox:GetValue() then
			
					client.SetConVar("mat_showmiplevels", 1, true)
			else
					client.SetConVar("mat_showmiplevels", 0, true) 
            end
			
			if csgo_fun_visual_feature3_checkbox:GetValue() then
			
					client.SetConVar("ent_fire", "!self addoutput effect 4", true)
			
			end
			
			if csgo_fun_visual_feature4_checkbox:GetValue() then
			
					client.SetConVar("sv_party_mode", 1, true)
			else
			
					client.SetConVar("sv_party_mode", 0, true)
				
			end
			
			if csgo_fun_visual_feature5_checkbox:GetValue() then
			
					client.SetConVar("cl_wpn_sway_scale", csgo_fun_visual_feature5_slider:GetValue(), true)
			else
			
					client.SetConVar("cl_wpn_sway_scale", 1.6, true)
				
			end
	else
	
		csgo_fun_svcheats_checkbox:SetDisabled(true)	--making sv_cheats non clickable when the master switch is off--
		client.SetConVar("mat_showmiplevels", 0, true)
		
	end
	
end


--todo:
--weapon_recoil_view_punch_extra 0.055 (default) - 100


--Callbacks--
callbacks.Register("Draw", csgo_fun_master)