function player_state_knockout(){
	
	//Change flags
	direction_allow = false;
	movement_allow = false;
	
	//Different knockout states
	switch(knockout_type)
	{
		case K_HURT:
			//Change animation
			animation_play(animator, ANIM.HURT);
			
			//Exit when grounded
			if(ground)
			{
				state = player_state_normal;
				ground_speed = 0;
				knockout_type = 0;
				exit;
			}
		break;
		
			case K_STUNNED:
			//Change animation
			animation_play(animator, ANIM.HURT);
			
			//Exit when grounded
			if(ground)
			{
				state = player_state_normal;
				ground_speed = 0;
				knockout_type = 0;
			}
		break;
		
		case K_DIE:
		
		case K_DROWN:
			//Remove underwater physics
			if(knockout_type == K_DIE)
			{
				underwater = false;
				//Change player depth
				depth = layer_get_depth("Utilities");
			}
			
			//Change animation
			animation_play(animator, knockout_type == K_DIE ? ANIM.DIE : ANIM.DROWN);
			
			//Disable collision
			collision_allow = false;
			x_speed = 0;
			ground_speed = 0;
			
			//Add death timer
			death_timer += 1;
			
			//Remove effects
			shield = S_NONE;
			invincible_timer = 0;
			speed_shoes = 0;
			invincible = false;
			speed_shoes_flag = false;
			hitbox_allow = false;
			
			//Fade out
			if(death_timer == 120)
			{
				if(global.life != 0 || !is_time_over)
				{
					global.life -= 1;
					if(global.life != 0 && !is_time_over)
					{
						fade_change(FADE_OUT, 3,FADE_BLACK)
						music_set_fade(FADE_OUT, 2);
					}
				}
			}
			
			//Create game over
			if(death_timer == 80)
			{
				if(global.life = 0 || is_time_over)
				{
					global.store_player_state.combinering = 0
					global.store_player_state.shield = S_NONE
					global.store_player_state.rings = 0
					ds_list_clear(global.store_object_state)
					music_set_fade(FADE_OUT, 2);
					if(!instance_exists(obj_game_over))	
					{
						var a = instance_create_layer(0, 0, "Utilities", obj_game_over);
						if(global.life = 0)a.type = 0; else a.type = 1;
					}
				}
			}
			
			//Create bunch of bubbles for drowning event
			if(FRAME_TIMER mod 4 == 0 && knockout_type == K_DROWN){
				var bubble = instance_create_depth(x, y-12, depth-1, obj_bubble);
				bubble.type = 0;	
				bubble.angle = random(360);
			}
			
			//Restart
			if(death_timer == 160 && global.life != 0 && !is_time_over)
			{
				global.store_player_state.combinering = 0
				global.store_player_state.shield = S_NONE
				global.store_player_state.rings = 0
				ds_list_clear(global.store_object_state)
				room_restart();
			}
		break;
	}
}