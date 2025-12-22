     
	var _scale = 1.2 + (dcos(1 * 8) * 0.22)
	image_xscale = _scale
	image_yscale = _scale
	
	var RandomRingSparkle = [spr_ring_sparkle, spr_ring_sparkle, spr_ring_sparkle, spr_ring_sparkle, spr_ring_sparkle, spr_ring_sparkle];
	//Add timer
	timer++
	
	//Shatter the big ring
	if(timer > 256)
	{
		create_ringloss(rings);
		play_sound(sfx_dust);
		play_sound(sfx_ringloss);
		dust_effect(0);
		obj_player.combineloss = 0;
		instance_destroy();	
	}
	
	//Collect the ring
	if(obj_player.state != player_state_knockout && player_collide_object(C_MAIN))
	{
		global.rings += rings;	
		instance_destroy();
		play_sound(sfx_ring);
		obj_player.combineloss = 0;
		for (var i = 0; i < 4; ++i) {
		    create_effect(x + random_range(-16, 16), y + random_range(-16, 16), spr_ring_sparkle, 0.2);	
		}
	}
	
	//Create effects
	if(FRAME_TIMER mod 8 == 0)
	{
		create_effect(x + random_range(-16, 16), y + random_range(-16, 16), spr_ring_sparkle, 0.2);	
		create_effect(x + random_range(-16, 16), y + random_range(-16, 16), spr_ring_sparkle, 0.2);	
	}
	
	
	//Add speeds to position
	x += x_speed;
	y += y_speed;
	
	//Gravity
	y_speed += 0.09375;
			
	//Collision offset
	var offx, offy;
	offx = (bbox_right - bbox_right)/2;
	offy = (bbox_bottom - bbox_top)/2;
			
	//Collision detection
	while(collision_point_check(0, -16, 0, plane, false, true) && y_speed < 0)
	{
		y_speed *= -1;
		y += 1;
	}
	while(collision_point_check(0, 16, 0, plane, true, true) && y_speed > 0)
	{
		y_speed *= -1;
		y -= 1;
	}
	while(collision_point_check(-16, 0, 0, plane, false, true) && x_speed < 0)
	{
		x_speed *= -1;
		x += 1;
	}
	while(collision_point_check(16, 0, 0, plane, false, true) && x_speed > 0)
	{
		x_speed *= -1;
		x -= 1;
 
	}

	