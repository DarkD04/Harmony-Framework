/// @description Script
	angle0 = (angle0 + 144*obj_player.facing) mod 360;
	angle1 = (angle1 + 16*obj_player.facing) mod 360;
	
	xa = obj_player.x;
	ya = obj_player.y;
	
	xb = obj_player.record_x[max(obj_player.record_timer-2, 0) mod 60];
	yb = obj_player.record_y[max(obj_player.record_timer-2, 0) mod 60];
	
	xc = obj_player.record_x[max(obj_player.record_timer-4, 0) mod 60];
	yc = obj_player.record_y[max(obj_player.record_timer-4, 0) mod 60];
	
	xd = obj_player.record_x[max(obj_player.record_timer-6, 0) mod 60];
	yd = obj_player.record_y[max(obj_player.record_timer-6, 0) mod 60];

	depth = obj_player.depth - 10;
	if(!obj_player.invincible) instance_destroy();