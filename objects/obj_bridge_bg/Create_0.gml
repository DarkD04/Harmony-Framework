/// @description Add background
	
	//Inherit the parent event
	event_inherited();
	
	//Vertical scroll factor
	var v_scroll = 0.95;
	
	//Add backgrounds
	add_background(0, spr_bg_bridge_sky, 0, 0.97, v_scroll, 0, 0, 0, 0);
	add_background(1, spr_bg_bridge_mount, 0, 0.93, v_scroll, 0, 0, 0, 112);
	add_background(2, spr_bg_bridge_tree, 0, 0.88, v_scroll, 0, 0, 0, 144);
	add_background_line(3, spr_bg_bridge_water, 0, 0.87, v_scroll, 0.02, 0, 0, 208, 2, 0.07);