/// @description Draw checkpoint

	//Draw main body
	draw_sprite(spr_checkpoint_body, 0, x, y);
	
	//Draw checkpoint ball (IDLE)
	if(angle != -720)draw_sprite(spr_checkpoint_ball, 0, x + 11 * dsin(angle), (y - 45) - 11 * dcos(angle));
	else //Draw checkpoint ball (Flashing)
	draw_sprite(spr_checkpoint_ball_flash, FRAME_TIMER / 3, x + 11 * dsin(angle), (y - 45) - 11 * dcos(angle));
	
	if star_type > 0 //Draw the stars
	{
		var starAngleX = star_angle_x / (512/360)
		var starAngleY = star_angle_y / (512/360)
		var otherTimer = 3.0 * dsin(starAngleY)
		star_frame = (star_angle_y mod 15) >> 2
		for (var i = 0; i < 4; ++i)
		{
			var otherTimerMult = otherTimer * dsin(starAngleX+i*90)
			var xoffset = dsin(starAngleX+i*90)*star_radius*0.25
			var yoffset = (otherTimerMult+dcos(starAngleX+i*90))*star_radius/32
			draw_sprite(spr_checkpoint_star,star_frame,floor(x+xoffset),floor(y+yoffset-star_ydiff))
		}
		
	}