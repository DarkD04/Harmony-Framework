/// @description Values
	//Inherite values
	event_inherited();
	
	//Create the new animator
	animator = new animator_create();
	
	//Add animations
	animation_add(0, spr_fire_shield, 1, 0, true, true);
	animation_add(1, spr_fire_shield_dash, 1, 0, true, true);
	
	//Play the first animation
	animation_play(animator, 0);