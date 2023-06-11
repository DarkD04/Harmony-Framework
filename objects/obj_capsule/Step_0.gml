/// @description Capsule script

	//Button code
	with(button){
		//When player is on the button
		if(player_collide_object(C_BOTTOM) && !pressed){
			//Stop the timer
			input_disable = true;
			
			//Create flickies
			for(var i = 0; i < 10; i++){
				var animal = instance_create_depth(other.x + random_range(-24, 24), other.y+32, depth, obj_flicky);
				animal.delay = 16+(4 * i);
			}
			
			//Create pieces
			var piece = instance_create_depth(x-20, y+32, depth-200, obj_capsule_piece)
			piece.image_index = 1;
			piece.x_speed = -2;
			piece.y_speed = -4;
			
			piece = instance_create_depth(x, y+32, depth-200, obj_capsule_piece)
			piece.image_index = 2;
			piece.y_speed = -5;
			
			piece = instance_create_depth(x+20, y+32, depth-200, obj_capsule_piece)
			piece.image_index = 0;
			piece.x_speed = 2;
			piece.y_speed = -4;
			
			//play_sound(sfx_beep);
			pressed = true;
			other.active = true;
		}
		
		//Move the button
		if(pressed) y = lerp(y, ystart+8, 0.2) else y = lerp(y, ystart, 0.2); 
	}
	
	if(active){
		//Add the timer
		timer += 1;
		
		//Change capsule sprite to destroyed
		image_index = 1;
		
		//Lock the obj_camera
		obj_camera.target_left = x - obj_camera.center_x;
		obj_camera.target_right = x + obj_camera.center_x;
		
		//Exploder
		if(timer < 32 && timer mod 4 = 1){
			create_effect(x+random_range(-32, 32), y+32+random_range(-32, 32), spr_effect_explosion01, 0.3);
			play_sound(sfx_destroy);
		}
		
		//Act clear
		if(!instance_exists(obj_act_clear) && timer = 100){
			obj_level.disable_timer = true;
			obj_level.act_transition = false;
			instance_create_depth(0, 0, obj_hud.depth, obj_act_clear);
		}
		
	}