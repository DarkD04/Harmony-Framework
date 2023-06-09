function player_water(){
	//Stop executing if theres no water
	if(!instance_exists(obj_water) || !collision_allow) exit;
	
	//Entering water
	if(y >= obj_water.y)
	{
		//Player hitting the water
		if(!underwater)
		{
			//Slow down the player
			x_speed *= 0.5;
			y_speed *= 0.25;
			
			//Create effects
			create_effect(x, obj_water.y, spr_water_splash, 0.35);
			
			//Play sound
			play_sound(sfx_water_splash);
		}
		
		//Trigger the flag
		underwater = true;
	}
	
	//Exiting water
	if(y < obj_water.y)
	{
		//Player hitting the water
		if(underwater)
		{
			//Speed up the player
			y_speed *= 1.25;
			
			//Create effects
			create_effect(x, obj_water.y, spr_water_splash, 0.35);
			
			//Play sound
			play_sound(sfx_water_splash);
		}
		
		//Trigger the flag
		underwater = false;
	}
	
	//Aquaphobia
	if(underwater)
	{
		//Add air timer
		air += 1;
			
		//Play warning sound
		if(air == 6*60 || air == 12*60 || air == 18*60) play_sound(sfx_air_warning);
			
		//Uh oh drowning music
		if(!audio_is_playing(j_drowning) && air == 20 * 60){
			var jing = audio_play_sound(j_drowning, 0, false);
			audio_sound_gain(jing, global.bgm_volume, 0);
		}
			
		if(global.object_timer mod 60 == 0 || global.object_timer mod 60 == 40){
			var bubble = instance_create_depth(x, y-4, depth-1, obj_bubble);
			bubble.type = 0;	
			bubble.angle = random(360);
		}
	}else
	{
		air = 0;
	}
	
	if(air < 20*60) audio_stop_sound(j_drowning);
	
	//Drown!
	if(air > 32*60 && knockout_type != K_DROWN){
		play_sound(sfx_drown);
		obj_camera.mode = 99;
		state = ST_KNOCKOUT;
		knockout_type = K_DROWN;
	}
	//Create the countdown
	switch(air){
		case 20*60:
			var drown_bubble = instance_create_depth(x+6*facing, y-4, depth-10, obj_drown_bubble);
			drown_bubble.animation = spr_bubble_number_5;
			break;
				
		case 22*60:
			var drown_bubble = instance_create_depth(x+6*facing, y-4, depth-10, obj_drown_bubble);
			drown_bubble.animation = spr_bubble_number_4;
			break;	
				
		case 24*60:
			var drown_bubble = instance_create_depth(x+6*facing, y-4, depth-10, obj_drown_bubble);
			drown_bubble.animation = spr_bubble_number_3;
			break;	
				
		case 26*60:
			var drown_bubble = instance_create_depth(x+6*facing, y-4, depth-10, obj_drown_bubble);
			drown_bubble.animation = spr_bubble_number_2;
			break;	
				
		case 28*60:
			var drown_bubble = instance_create_depth(x+6*facing, y-4, depth-10, obj_drown_bubble);
			drown_bubble.animation = spr_bubble_number_1;
			break;
				
		case 30*60:
			var drown_bubble = instance_create_depth(x+6*facing, y-4, depth-10, obj_drown_bubble);
			drown_bubble.animation = spr_bubble_number_0;
			break;	
	}
}