	/// @description Draw the animator
	
	//Flashing
	if(global.object_timer mod 4 == 0 && animation_is_playing(animator, 0) || !animation_is_playing(animator, 0))
	{
		draw_animator(animator);
	}
	else
	{
		draw_animator(animator_front);
	}