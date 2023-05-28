/// @description Hurt player
	if(obj_player.invincible_timer != 0) exit;
	if(player_collide_object(C_BOTTOM) && image_yscale = 1 || player_collide_object(C_TOP) && image_yscale = -1 )
	{
		play_sound(sfx_spike);
		obj_player.knockout_type = K_HURT;	
	}