/// @description Values
// You can write your code in this editor
	//Inherite values
	event_inherited();
	
	//Create the new animator
	animator = new animator_create();
	
	//Add animations
	animation_add(0, spr_bubble_shield, 3, 0, true, true);
	animation_add(1, spr_bubble_shield_bounce, 2, 0, false, true);
	animation_add(2, spr_bubble_shield_bounce_reverse, 2, 0, false, true);
	
	//Play the first animation
	animation_play(animator, 0);
	
	//Create the animator for front layer
	animator_front = new animator_create();
	
	//Add
	animation_add(3, spr_bubble_shield_other, 4, 0, true, true);
	
	animation_play(animator_front, 3);