/// @description Script
	
	//Physics
	y += y_speed;
	y_speed += 0.2;
	landed = false;
		

	//Bounce physics
	while(obj_check_point(x, bbox_bottom, true) && y_speed >= 0)
	{
		y -= 1;
		landed = true;
	}
	
	//Commit the bounce
	if(landed)
	{
		bounce = true;
		y_speed = -4;
	}
	
	//Start adding timer after ring bounced
	if(bounce) timer++;
	
	//Turn into dust
	if(timer = 36)
	{
		play_sound(sfx_dust);
		dust_effect(0);
	}