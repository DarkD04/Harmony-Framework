	/// @description Setup

	// Inherit the parent event
	event_inherited();
	
	//Create the animator
	animator = new animator_create();
	
	//Add only one animations
	animation_add(0, spr_shield, 1, 0, true, true);
	
	//Play the first animation
	animation_play(animator, 0);