/// @description Script
	x = floor(obj_player.x - 32);
	y = obj_water.y + (1 * abs(1-obj_player.on_object));
	
	//Change collision size
	image_xscale = 4;
	image_yscale = 0.5;
	
	//Disable flag
	collision_flag = false;
	
	//Change flag
	if(obj_player.y < y && abs(obj_player.ground_speed) >= 4 && obj_player.ground && obj_player.y_speed >= 0 && obj_player.y_speed <= 1 && obj_player.mode = 0)
		collision_flag = true;
		
	//Player effect
	if(player_collide_object(C_BOTTOM) && collision_flag && global.object_timer mod 4 = 0)
	{
		//Create effects
		create_effect(obj_player.x, obj_water.y, spr_water_splash, 0.35, obj_player.depth+1);
			
		//Play sound
		play_sound(sfx_water_splash);	
	}