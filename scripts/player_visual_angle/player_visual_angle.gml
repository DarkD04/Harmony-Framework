function player_visual_angle(){
	//Visual angle
	if(ground)
	{
		if(!global.legacy_rotation)
		{
			//Visual angle wraping
			if(ground_angle <= 45 && visual_angle >= 180) visual_angle = 0;
			if(ground_angle >= 180 && visual_angle <= 45) visual_angle = 360;
		
			//Rorate to the target
			if(ground_angle >= 40 && ground_angle <= 320)
				visual_angle = visual_angle + (0.15 + abs(ground_speed * 0.03)) * (ground_angle - visual_angle);
			
			//Return back to 0
			if(ground_angle < 40) visual_angle = max(visual_angle - 2 - abs(ground_speed * 0.8), 0);
			if(ground_angle > 320) visual_angle = min(visual_angle + 2 + abs(ground_speed * 0.8), 360);
			

		}
		if(global.legacy_rotation)
		{
			//Snap at 8 direction
			visual_angle = round(ground_angle/45)*45;	
			
			//Don't enable rotation at angles that are not steep
			if(ground_angle < 40 || ground_angle > 360-40) visual_angle = 0;
			
		}
	}
	else
	{
		if(visual_angle <= 180) visual_angle = max(visual_angle-2.8125, 0) else visual_angle = min(visual_angle+2.8125, 360);
		
	}
	//Force visual angle to 0 when wrong animation is playing
	if(animation != ANIM_WALK && animation != ANIM_RUN && animation != ANIM_MAXRUN) visual_angle = 0;
	
	//Change image angle
	if(!global.legacy_rotation)image_angle = visual_angle; else image_angle = round(visual_angle/45)*45;
	

}