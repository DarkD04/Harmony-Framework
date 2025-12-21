/// @description Script
	//Code written by joshyflip
	bouncing = false

	with(child_right)
	{
		if(player_collide_object(C_BOTTOM_EXT) && obj_player.ground)
		{
			other.right_override = true;
			obj_player.y +=6;
		}
		y = other.y+64+other.weight;
	}

	with(child_weight)
	{
		if(!ground) yspeed += 0.22;
		y += yspeed;
		while(instance_place(x,y,other.child_right) && !ground && yspeed > 0)
		{
			yspeed = 0;
			y-=1;
			ground = true;
			other.bouncing = true;
		}
		if(ground)
		{
			y=other.child_right.y;
		}
		if(ground || other.right_override)
		{
			other.weightoff = false;
		}
		if(!ground && !other.right_override)
		{
			other.weightoff = true;
		}
		if(other.right_override)
		{
			other.weightoff = false;
		}
		if(!other.weightoff) other.weight = min(other.weight+6,16);
		if(other.weightoff) other.weight = max(other.weight-6,-16);
	
		if(player_collide_object(C_TOP) && obj_player.ground)
		{
			obj_player.knockout_type = K_DIE;
		}
	}

	right_override = false

	with(child_left)
	{
		if(player_collide_object(C_BOTTOM_EXT) && other.child_weight.ground && obj_player.ground)
		{
			if(other.bouncing = false)
			{
				other.child_weight.ground = false;
				other.child_weight.yspeed = -8;
				if(on_screen()) play_sound(sfx_spring);
				obj_player.y +=6;
			}
			else
			{
				with(obj_player)
				{
					animation_play(animator, ANIM_SPRING);
					state = ST_SPRING;
					y_speed = -10;
					ground = false;
				}
				if(on_screen()) play_sound(sfx_spring);
			} 
		}
		y = other.y+64-other.weight
	}



	for (var i = 0; i < 5; ++i) 
	{
	    with(child_bead[i])
		{
			y = other.y +72+(other.weight*0.25)*(i-2);
		}
	}