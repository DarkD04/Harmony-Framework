/// @description Hurt player
	if(player_collide_object(C_RIGHT) && image_xscale = 1 || player_collide_object(C_LEFT) && image_xscale = -1 )
	{
		play_sound(sfx_spike);
		obj_player.knockout_type = K_HURT;	
	}