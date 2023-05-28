/// @description Draw the player
	if(state = ST_KNOCKOUT || invincible_timer mod 12 >= 6 || invincible_timer = 0 || invincible)
		{
		if(speed_shoes)
		{
			for (var i = 0; i < 3; ++i) 
			{
				if((global.object_timer + 5*i) mod 8 < 4 )
				{
					var gap = 9 - (3 * i)
					draw_sprite_ext(record_sprite[max(record_timer - gap, 0) mod 60], record_frame[max(record_timer - gap, 0) mod 60], record_x[max(record_timer - gap, 0) mod 60], record_y[max(record_timer - gap, 0) mod 60], record_direction[max(record_timer - gap, 0) mod 60], 1, record_angle[max(record_timer - gap, 0) mod 60], c_white, 1);
				}
			}
		}
	
		//Draw the player:
		draw_sprite_ext(animation_sprite, animation_frame, floor(x), floor(y), image_xscale, 1, image_angle, c_white, 1);
	}