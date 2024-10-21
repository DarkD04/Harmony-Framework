/// @description Values
	triggered = false;
	spring_power = 10;
	
	//Create the new animator
	animator = new animator_create();

	//Different spring types
	switch(spring_type)
	{
		case "Yellow":
			animation_add(0, spr_spring_horizontal_yellow, 0.6, 0, false);
			spring_power = 10;
		break;
		
		case "Red":
			animation_add(0, spr_spring_horizontal_red, 0.6, 0, false);
			spring_power = 16;
		break;
	}
	
	//Play the first animation
	animation_play(animator, 0)