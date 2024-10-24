/// @description Draw monitors
	draw_self_floor();
	
	//Stop if destroyed
	if(destroyed) exit;
	
	//Draw the icon
	draw_sprite(monitor_icon, 0, x, floor(y) - 4);
	
	//Draw monitor static
	draw_sprite(spr_monitor_static, min((global.object_timer / 4) mod 30, 7), x, floor(y) - 4);