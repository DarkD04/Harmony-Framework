function player_state_skid(){
	//Get input presses
	var mov = Input.Right - Input.Left;
	
	//Trigger the state
	if(state = ST_NORMAL && mov = -sign(ground_speed) && ground && abs(ground_speed) > 4 && sign(ground_speed) = facing && mode = 0 && control_lock = 0)
	{
		skid_timer = 0;
		animation = ANIM_SKID;
		state = ST_SKID;
		play_sound(sfx_skid);
	}

	//If not skidding stop
	if(state != ST_SKID) exit;
	
	//Change flags
	direction_allow = false;
	movement_allow = false;
	
	//Add timer
	if(mov = facing || mov = 0 || mode != 0) skid_timer++;
	
	//Return to normal state in some cases
	if(skid_timer > 16 || !ground || ground_angle > 80 && ground_angle < 180 || ground_angle > 180 && ground_angle < 360-80){
		state = ST_NORMAL;
	}
	
	//Decelerate
	if(mov = -facing && mode = 0) ground_speed = approach(ground_speed, -1 * facing, 0.5);
	
	//Done
	if(animation = ANIM_SKIDTURN && animation_frame >= 1){
		facing *= -1;
		state = ST_NORMAL;
		ground_speed = 1 * facing;
	}
	
	//Turn
	if(ground_speed >= -1 && ground_speed <= -0.5 && animation = ANIM_SKID && animation_frame = image_number - 1 && facing = 1||
	ground_speed >= 0.5 && ground_speed <= 1 && animation = ANIM_SKID && animation_frame = image_number - 1 && facing = -1) animation = ANIM_SKIDTURN;
	

}