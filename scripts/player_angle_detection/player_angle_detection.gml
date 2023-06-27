function player_angle_detection(){
	if(!ground_collision_allow) exit;
	if(!ramp_fix)ground_angle = 0;
	if(ground && !on_object && !ramp_fix) ground_angle = get_angle()
}