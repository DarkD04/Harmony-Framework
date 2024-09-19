/// @description Add background
	
	//Inherit the parent event
	event_inherited();
	
	//Vertical scroll factor
	var v_scroll = 0.88;
	
	//Add backgrounds
	add_background(spr_bg_teststage_clouds, 0, 0.9, v_scroll, -0.2, 0, 0, 0);
	add_background(spr_bg_teststage_clouds, 1, 0.93, v_scroll, -0.15, 0, 0, 0);
	add_background(spr_bg_teststage_clouds, 2, 0.95, v_scroll, -0.1, 0, 0, 0);
	add_background(spr_bg_teststage_clouds, 3, 0.97, v_scroll, -0.05, 0, 0, 0);
	add_background(spr_bg_teststage_clouds, 4, 0.99, v_scroll, 0, 0, 0, 0);
	add_background_line(spr_bg_teststage_water, 0, 0.94, v_scroll, 0, 0, 0, 128, 2, 0.05);
	add_background(spr_bg_teststage_mountains, 0, 0.98, v_scroll, 0, 0, 0, 80);
	add_background(spr_bg_teststage_mountains, 1, 0.94, v_scroll, 0, 0, 0, 80);
	add_background(spr_bg_teststage_bottom, 4, 1, v_scroll, 0, 0, 0, 164);
	add_background(spr_bg_teststage_bottom, 2, 0.84, v_scroll, 0, 0, 0, 144);
	add_background(spr_bg_teststage_bottom, 0, 0.8, v_scroll, 0, 0, 0, 144);
	add_background(spr_bg_teststage_bottom, 1, 0.78, v_scroll, 0, 0, 0, 144);
	add_background(spr_bg_teststage_bottom, 3, 0.72, v_scroll, 0, 0, 0, 144);