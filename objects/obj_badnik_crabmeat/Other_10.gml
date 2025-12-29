/// @description Init state
	animation_play(animator, 0)
	animation_set_frame(animator,2)
	
	state_time++
	x_speed = 0;
	if(state_time > 90) {
		state = 1;
		walk_distance = 60;
		state_time = 0;
	}
	
	
	