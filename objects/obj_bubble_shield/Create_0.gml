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
	
	jump = function(){
		//Player double jump
		obj_player.x_speed = 0;
		obj_player.y_speed = 8;
		
		//Switch shield state
		shield_state = 1;
		
		//Play sound
		play_sound(sfx_bubble_jump)
		
		//Change animation
		animation_play(animator, 1);	
	}