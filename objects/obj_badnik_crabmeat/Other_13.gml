/// @description Await

	animation_set_frame(animator,2)
	
	state_time++;
	x_speed = 0;
	if(state_time > 90) {
		state = 2;
		state_time = 0;
	}