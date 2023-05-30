/// @description Parent script
	
	//Destroy the enemy
	if(player_collide_object(C_MAIN))
	{
		if(obj_player.attacking)
		{
		//Create battery ring TODO: add flicky support
		var ring = instance_create_depth(x, y, depth, obj_battery_ring);
		ring.y_speed = -4;
		
		//Player bounce
		obj_player.y_speed = -abs(obj_player.y_speed);
		
		//Create score object and add combo and badnik chain
		obj_level.badnik_chain += 1;
		create_score();
		
		//Create explosion effect
		create_effect(x, y, spr_effect_explosion01, 0.3);
		
		//Play destroying sound
		play_sound(sfx_destroy);
		
		//Destroy badnik
		instance_destroy();	
		}else
		{
			//Player getting hurt
			obj_player.knockout_type = K_HURT;
		}
	}