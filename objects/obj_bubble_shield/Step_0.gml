/// @description Script	
	//Reset animation index
	if(sprite_index != spr_bubble_shield_bounce_reverse && shield_state = 0)
	{
		//Animation speed
		image_speed = 0.35;
		
		//Change sprite
		flickercount = (flickercount + 1 )mod 4;
		bubbleframe = (flickercount == 0) ? bubbleframe + 1 : bubbleframe; //every 2 frames increase animation frame
		bubbleframe = bubbleframe mod 18
		
		if flickercount < 2{
			sprite_index = spr_bubble_shield;
			image_index = bubbleframe mod 2;
		}else{
			sprite_index = spr_bubble_shield_other;
			image_index = bubbleframe mod 9;
		}
	}
	
	//Double jump
	if(Input.ActionPress && !obj_player.ground && obj_player.state = ST_JUMP && shield_state = 0 && use_allow) 
	{
		//Player double jump
		obj_player.x_speed = 0;
		obj_player.y_speed = 8;
		
		//Switch shield state
		shield_state = 1;
		
		//Play sound
		play_sound(sfx_bubble_jump)
		
		//Change animation
		sprite_index = spr_bubble_shield_bounce;
		
		//Reset frame
		image_index = 0;
	}
	
	//Reset state flag
	if(shield_state = 1 && obj_player.ground || shield_state = 1 && obj_player.y_speed < 0)
	{
		//Player bounce
		if(obj_player.ground)
		{
			obj_player.x_speed = -7.5 * dsin(obj_player.ground_angle);
			obj_player.y_speed = -7.5 * dcos(obj_player.ground_angle);
			obj_player.ground = false;
			obj_player.state = ST_JUMP;
			obj_player.jump_flag = true;
			
			//Play sound
			play_sound(sfx_bubble_jump)
		}
		
		//Reset shield state
		shield_state = 0;	
		
		//Change animation
		sprite_index = spr_bubble_shield_bounce_reverse;
		
		//Reset frame
		image_index = 0;
	}
	
	//Bounce stop loop point
	if(sprite_index = spr_bubble_shield_bounce && image_index >= image_number - 1)
	{
		image_index = image_number-1;	
	}
	
	//Bounce reverse end
	if(sprite_index = spr_bubble_shield_bounce_reverse && image_index >= image_number - 1)
	{
		sprite_index = spr_bubble_shield;
		image_index = 0;
	}