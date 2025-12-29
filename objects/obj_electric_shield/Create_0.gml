	/// @description Setup

	// Inherit the parent event
	event_inherited();

	//Create the animator
	animator = new animator_create();
	
	//Add only one animations
	animation_add(0, spr_electric_shield, 2, 0, true, true);
	
	//Play the first animation
	animation_play(animator, 0);
	
	jump = function(){
		//Player double jump
		obj_player.y_speed = -5.5;
		
		//Switch shield state
		shield_state = 1;
		
		//Play sound
		play_sound(sfx_electric_shield_jump)
		
		//Make shield sparkles
		for (var i = 0; i < 4; ++i) 
		{
		    create_effect(x, y, spr_electric_sparks, 1, depth + 1, 2 * dsin(45+(90*i)), 2 * dcos(45+(90*i)))
		}	
	}