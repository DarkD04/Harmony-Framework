function player_water(){
	//Stop executing if theres no water
	if(!instance_exists(obj_water) || !collision_allow) exit;
	
	//Entering water
	if(y >= obj_water.y)
	{
		//Player hitting the water
		if(!underwater)
		{
			//Slow down the player
			x_speed *= 0.5;
			y_speed *= 0.25;
			
			//Create effects
			create_effect(x, obj_water.y, spr_water_splash, 0.35);
			
			//Play sound
			play_sound(sfx_water_splash);
		}
		
		//Trigger the flag
		underwater = true;
	}
	
	//Exiting water
	if(y < obj_water.y)
	{
		//Player hitting the water
		if(underwater)
		{
			//Speed up the player
			y_speed *= 1.25;
			
			//Create effects
			create_effect(x, obj_water.y, spr_water_splash, 0.35);
			
			//Play sound
			play_sound(sfx_water_splash);
		}
		
		//Trigger the flag
		underwater = false;
	}
}