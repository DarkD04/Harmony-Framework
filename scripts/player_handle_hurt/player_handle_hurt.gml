function player_handle_hurt()
{
	if(state != ST_KNOCKOUT)
	{
		//Reset knowckout type when you're invicible
		if(invincible || invincible_timer > 0)
		{
			knockout_type = 0;	
		}
		
		if(invincible_timer == 0 && !invincible)
		{
			if(knockout_type == K_HURT)
			{
				//Kill the player if there are no any rings or shields
				if(global.rings == 0 && shield == S_NONE)
				{
					knockout_type = K_DIE;	
				}
				
				//Hurt the player if they have any rings or shields
				if(global.rings != 0 || shield != S_NONE)
				{
					//Get the hurt side
					var side = 1;
					if(sign(x - hurt_position) != 0)
					{
						side = sign(x - hurt_position);
					}

					//Knockout the player
					x_speed = 2 * side;
					y_speed = -4;
					facing = -side;
					ground = false;
					
					//Underwater cases
					if(underwater)
					{
						x_speed *= 0.5;
						y_speed /= 2;
					}
					
					//Give player invincibility frames and put the player in knockout state
					invincible_timer = 120;
					state = ST_KNOCKOUT;
					
					//Commit ring loss when player gets hurt
					if(shield == S_NONE)
					{
						create_ringloss(global.rings);	
						play_sound(sfx_ringloss);
						global.rings = 0;
					}
					
					//Remove the shield when player gets hurt
					if(shield != S_NONE)
					{
						shield = S_NONE;
						play_sound(sfx_hurt);
					}
				}
			}
		}
		
		//Player's death event
		if(knockout_type == K_DIE)
		{
			//Set player to the knockout state
			state = ST_KNOCKOUT;
			
			//Bounce the player out
			y_speed = -7;
			x_speed = 0;
			ground = false;
			
			//Disable camera movement
			camera_set_mode(CAM_NULL);
			
			//Play the hurt sound
			play_sound(sfx_hurt);
		}
		
		//Kill the player after time has reached the limit
		if(global.stage_timer == 599999) 
		{
			knockout_type = K_DIE;
			is_time_over = true;
		}
	}
	
	//Bottomless pit death event
	if(y > obj_camera.target_bottom && y > obj_camera.limit_bottom && knockout_type != K_DIE)
	{
		knockout_type = K_DIE;
	}
	
	
}