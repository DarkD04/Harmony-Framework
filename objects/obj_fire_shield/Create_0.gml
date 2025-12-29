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
	
	jump = function(){
		//Dash the player
		obj_player.x_speed = 8 * obj_player.facing;
		obj_player.y_speed = 0;
		
		//The camera lag
		camera_set_lag(12);
		
		//Switch shield state
		shield_state = 1;
		
		//Play sound
		play_sound(sfx_fire_dash);	
	}