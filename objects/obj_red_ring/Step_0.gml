/// @description Script
    //Set in front of the player
    depth = obj_player.start_depth - 1;
    
	if(!ringloss && !collected)
	{
	    //Sync the animation
	    image_index = FRAME_TIMER / 4;
	}
	
    //Collect
    if(player_collide_object(C_MAIN) && obj_player.state != player_state_knockout && !collected)
    {
		//Play the sound
		play_sound(sfx_red_ring);
		
        //Add rings!
        //global.rings += 1;  
		if (!already_collected) {
			if (ds_map_exists(global.red_ring_map, obj_level.stage_name)) {
				global.red_ring_map[? obj_level.stage_name][index] = 1;
				show_debug_message(global.red_ring_map[? obj_level.stage_name][index]);
				
				
				
				var j = 0
				var count = 0
				repeat(obj_level.red_ring_count) {
					if global.red_ring_map[? obj_level.stage_name][j] = 1 {
						count ++;
					}
					j++;
				}
				if (count == obj_level.red_ring_count) {
					audio_stop_sound(sfx_red_ring);	
					play_sound(sfx_red_ring_all);
				}
			}
			
			var Object = instance_create_depth(x, y, depth-1, obj_score_effect);
			Object.image_index = 5;
			global.score += 5000;
			
		} else {
			play_sound(sfx_red_ring);
		}
		
		collected = true
		y_speed = -1.4
        //Create the effect
		if (!already_collected) {
			var i = 0
			repeat(16) {
				var ang = (360 / 16) * i  
				var spd = 2
				var ani_speed = 0.2
				if (i mod 2 == 0) {
					spd = 1	
					ani_speed = 0.08
				}
				create_effect(x, y, spr_red_ring_sparkle, ani_speed ,depth, lengthdir_x(spd, ang), lengthdir_y(spd * 1.2, ang),0,0.04);
				i++;
			}
		}
        
    }
	
	if (collected) {
		image_index = FRAME_TIMER / 2;
		
		alpha_death -= 0.032;
		if (alpha_death < 0) {
			instance_destroy();	
		}
		y_speed += 0.184
		y += y_speed
	}
	
	//Temp culling
	if(!on_screen() && !ringloss && !magnet && culling) instance_deactivate_object(id);