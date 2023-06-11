function player_visual_angle(){
	//Visual angle
	if(ground)
	{
		if(!global.legacy_rotation)
		{
			//Reset rotation target value
			var rot = 0;
			
			//Change rotation value if its at specific angle
			if(ground_angle > 33.75 && ground_angle < 333.50) rot = ground_angle;
			
			//Rotate the player
			if(abs(ground_speed < 6))
			visual_angle += (((rot - visual_angle + 540) mod 360)-180) / 4;
			else
			visual_angle += (((rot - visual_angle + 540) mod 360)-180) / 2;
			
			//Prevent angle from going into negative
			if(visual_angle < 0) visual_angle += 360
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