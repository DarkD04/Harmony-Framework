function player_state_roll(){
	//Trigger rolling
	if(state == ST_NORMAL && Input.Down && abs(ground_speed) > 1 && ground && !landed
	|| state == ST_JUMP && Input.Down && abs(ground_speed) > 1 && ground
	|| state == ST_LOOKDOWN && abs(ground_speed) > 1 && ground)
	{
		play_sound(sfx_roll);
		animation = ANIM_ROLL;
		state = ST_ROLL;
	}
	
	//Stop executing if not rolling
	if(state != ST_ROLL) exit;
	
	//Change animation and speed
	animation = ANIM_ROLL;
	if(ground && character != CHAR_TAILS)animation_set_speed = floor(max(0, 4-abs(ground_speed)));
	
	//Change flags
	attacking = true;
	if(ground)
	{
		movement_allow = false;
	}
	
	//Rolling physics
	if(sign(ground_speed) = sign(dsin(ground_angle))) ground_speed -= 0.078125 * dsin(ground_angle) else ground_speed -= 0.3125 * dsin(ground_angle)
				
	//Rolling driction
	ground_speed = approach(ground_speed, 0, 0.046875 / 2);
				
	//Stop rolling
	if(ground_angle < 40 || ground_angle > 360 - 40)
	{
		if(ground_speed == 0 && !force_roll && ground|| landed && !force_roll) state = ST_NORMAL;
	}
	if(landed && !force_roll) state = ST_NORMAL;
	
	//Turning to different direction
	if(ground_speed > 0 && Input.Left && !Input.Right && !force_roll) ground_speed -= 0.125;
	if(ground_speed < 0 && !Input.Left && Input.Right && !force_roll) ground_speed += 0.125;	
	
	//Force roll push
	if(abs(ground_speed) < 0.5 && force_roll)
	{
		if(ground_angle < 20 || ground_angle > 360 - 20)
			ground_speed = 2 * facing;
	}
}