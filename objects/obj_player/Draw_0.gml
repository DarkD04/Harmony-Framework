/// @description Draw the player
	if(state = ST_KNOCKOUT || invincible_timer mod 12 >= 6 || invincible_timer = 0 || invincible)
		{
		if(speed_shoes)
		{
			for (var i = 0; i < 3; ++i) 
			{
				//if((global.object_timer + 5*i) mod 8 < 4 )
				//{
					var gap = 9 - (3 * i);
					with(obj_tails_object)
					{
						if(appear)draw_sprite_ext(record_sprite[max(record_timer - gap, 0) mod 60], record_frame[max(record_timer - gap, 0) mod 60], other.record_x[max(other.record_timer - gap, 0) mod 60], other.record_y[max(other.record_timer - gap, 0) mod 60], obj_tails_object.record_direction[max(record_timer - gap, 0) mod 60], 1, obj_tails_object.record_angle[max(record_timer - gap, 0) mod 60], c_white, 1);
					}
					draw_sprite_ext(record_sprite[max(record_timer - gap, 0) mod 60], record_frame[max(record_timer - gap, 0) mod 60], record_x[max(record_timer - gap, 0) mod 60], record_y[max(record_timer - gap, 0) mod 60], record_direction[max(record_timer - gap, 0) mod 60], 1, record_angle[max(record_timer - gap, 0) mod 60], c_white, 1);
				//}
			}
		}
		//Draw tails segment
		if(character = CHAR_TAILS)
		{
			with(obj_tails_object)
			{
				if(appear)draw_sprite_ext(animation_sprite, animation_frame, floor(other.x), floor(other.y), image_xscale, 1, image_angle, c_white, 1);
			}
		}
		
		//Draw the player:
		draw_sprite_ext(animation_sprite, animation_frame, floor(x), floor(y), image_xscale, 1, image_angle, c_white, 1);
	}