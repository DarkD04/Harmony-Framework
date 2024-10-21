function player_state_knockout(){
	//Stop executing
	if(state != ST_KNOCKOUT) exit;
	
	//Change flags
	direction_allow = false;
	movement_allow = false;
	
	//Different knockout states
	switch(knockout_type)
	{
		case K_HURT:
			//Change animation
			animation_play(animator, ANIM_HURT);
			
			//Exit when grounded
			if(ground)
			{
				state = ST_NORMAL;
				ground_speed = 0;
				knockout_type = 0;
			}
		break;
		
		case K_DIE:
		
		case K_DROWN:
			//Change player depth
			depth = layer_get_depth("Utilities");
			
			//Remove underwater physics
			if(knockout_type == K_DIE)
			{
				underwater = false;
			}
			
			//Change animation
			animation_play(animator, knockout_type == K_DIE ? ANIM_DIE : ANIM_DROWN);
			
			//Disable collision
			collision_allow = false;
			
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
			if(death_timer == 80)
			{
				if(global.life != 0 || !is_time_over)
				{
					global.life -= 1;
					if(global.life != 0 && !is_time_over)
					{
						obj_fade.fade_speed = 3;
						obj_fade.fade_type = FADE_OUT;
						music_set_fade(FADE_OUT, 2);
					}
				}
			}
			
			//Create game over
			if(death_timer == 80)
			{
				if(global.life = 0 || is_time_over)
				{
					music_set_fade(FADE_OUT, 2);
					if(!instance_exists(obj_game_over))	
					{
						var a = instance_create_layer(0, 0, "Utilities", obj_game_over);
						if(global.life = 0)a.type = 0; else a.type = 1;
					}
				}
			}
			
			//Create bunch of bubbles for drowning event
			if(global.object_timer mod 4 == 0 && knockout_type == K_DROWN){
				var bubble = instance_create_depth(x, y-12, depth-1, obj_bubble);
				bubble.type = 0;	
				bubble.angle = random(360);
			}
			
			//Restart
			if(death_timer == 140 && global.life != 0 && !is_time_over)
			{
				room_restart();
			}
		break;
	}
}