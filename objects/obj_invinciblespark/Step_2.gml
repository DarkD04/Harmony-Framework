/// @description Script
	flicker = 1 - flicker
	
	angle = (angle + 16*obj_player.facing) mod 360;
	
	switch(mode){
		case 0:
		x = obj_player.x;
		y = obj_player.y;
		depth = obj_player.depth - 10;
		break;
		
		case 1:
		x = obj_player.record_x[max(obj_player.record_timer-2, 0) mod 60];
		y = obj_player.record_y[max(obj_player.record_timer-2, 0) mod 60];
		depth = obj_player.depth + 2;
		break;
		
		case 2:
		x = obj_player.record_x[max(obj_player.record_timer-4, 0) mod 60];
		y = obj_player.record_y[max(obj_player.record_timer-4, 0) mod 60];
		depth = obj_player.depth + 4;
		break;
	}
	if(!obj_player.invincible) instance_destroy();