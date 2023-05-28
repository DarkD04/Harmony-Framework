function player_angle_detection(){
	if(!ramp_fix)ground_angle = 0;
	if(ground && !on_object && !ramp_fix) ground_angle = get_angle()
	
	//if(ramp_fix) ground_angle = 0;
}