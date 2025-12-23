/// @description Values
	triggered = false;
	crumple = false;
	fall_speed = 0
	//Create the new animator
	animator = new animator_create();

	animation_add(0, spr_crumple_spring, 0.6, 0, false);
	spring_power = 14;
	
	//Play the first animation
	animation_play(animator, 0)