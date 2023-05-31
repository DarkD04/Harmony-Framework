/// @description Script
	//Animation speed
	image_speed = 0.65;
	back.image_speed = 0.65;
	
	//Reset stuff
	sprite_index = spr_fire_shield_front
	image_xscale = 1;
	back.visible = true;
	
	//Change depth
	depth = obj_player.depth - 10;
	back.depth = obj_player.depth + 10;
	
	//flicker effect
	flickercount = (flickercount + 1) mod 4;
	
	if (flickercount < 2)
	{
		back.visible = false;
		visible = true;
	} else
	{
		back.visible = true;
		visible = false;
	}
	
	
	//Sync back shield's animation
	back.image_index = image_index;
	
	if(!is_back)
	{
		//Double jump
		if(Input.ActionPress && !obj_player.ground && obj_player.state = ST_JUMP && shield_state = 0) 
		{
			//Dash the player
			obj_player.x_speed = 8 * obj_player.facing;
			obj_player.y_speed = 0;
		
			//The camera lag
			obj_camera.h_lag = 12;
		
			//Switch shield state
			shield_state = 1;
		
			//Play sound
			play_sound(sfx_fire_dash);
		}
	
		//When dashing
		if(shield_state = 1)
		{
			//Reset shield state
			if(obj_player.ground || obj_player.state != ST_JUMP)
			{
				shield_state = 0;	
			}
			
			//Change animation
			sprite_index = spr_fire_shield_dash;
			image_speed = 1;
			
			//Change direction
			if(obj_player.x_speed != 0)image_xscale = sign(obj_player.x_speed);
			
			//Make back shield gone
			visible = true;
			back.visible = false;
		}
	}
	
	//Begone when underwater
	if(obj_player.underwater) obj_player.shield = S_NONE;