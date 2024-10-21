function player_visual_angle(){
	//Visual angle
	if(ground)
	{
		switch(global.rotation_type)
		{
			case 0:
				//Reset rotation target value
				var rot = 0;
			
				//Change rotation value if its at specific angle
				if(ground_angle > 33.75 && ground_angle < 333.50) 
				{
					rot = ground_angle;
				}
				
				//Rotate the player
				if(abs(ground_speed) < 6)
				{
					visual_angle += (((rot - visual_angle + 540) mod 360)-180) / 4;
				}
				else
				{
					visual_angle += (((rot - visual_angle + 540) mod 360)-180) / 2;
				}
			
				//Prevent angle from going into negative
		        visual_angle = (visual_angle + 360) mod 360;
			break;
			
			case 1:
				//Snap at 8 direction
				visual_angle = round(ground_angle/45)*45;	
			
				//Don't enable rotation at angles that are not steep
				if(ground_angle < 34 || ground_angle > 360-34) 
				{
					visual_angle = 0;	
				}
			break;
			
			case 2:
				//Reset rotation target value
				var rot = 0;
			
				//Change rotation value if its at specific angle
				rot = ground_angle;
				
				//Rotate the player
				if(abs(ground_speed) < 6)
				{
					visual_angle += (((rot - visual_angle + 540) mod 360)-180) / 4;
				}
				else
				{
					visual_angle += (((rot - visual_angle + 540) mod 360)-180) / 2;
				}
			
				//Prevent angle from going into negative
		        visual_angle = (visual_angle + 360) mod 360;
			break;
		}
	}
	else
	{
		if(visual_angle <= 180) 
		{
			visual_angle = max(visual_angle-2.8125, 0)
		}
		else
		{
			visual_angle = min(visual_angle+2.8125, 360);
		}
		
	}
	
	//Force visual angle to 0 when wrong animation is playing
	if(!animation_is_playing(animator, ANIM_WALK) && !animation_is_playing(animator, ANIM_RUN) && !animation_is_playing(animator, ANIM_MAXRUN))
	{
		visual_angle = 0;
	}
	
	if(global.rotation_type == 1)
	{
		image_angle = round(visual_angle/45)*45;
	}
	else
	{
		image_angle = visual_angle;	
	}
}