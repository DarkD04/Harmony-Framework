/// @description Draw checkpoint

	//Draw main body
	draw_sprite(spr_checkpoint_body, 0, x, y);
	
	//Draw checkpoint ball (IDLE)
	if(angle != -720)draw_sprite(spr_checkpoint_ball, 0, x + 11 * dsin(angle), (y - 45) - 11 * dcos(angle));
	else //Draw checkpoint ball (Flashing)
	draw_sprite(spr_checkpoint_ball_flash, global.object_timer / 3, x + 11 * dsin(angle), (y - 45) - 11 * dcos(angle));