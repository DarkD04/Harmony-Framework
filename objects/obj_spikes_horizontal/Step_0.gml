/// @description Hurt player
	if(obj_player.invincible_timer != 0) exit;
	
	//Get the center of the hitbox
	var center_x = bbox_left + (bbox_right - bbox_left) / 2;
	
	//Hurt the player
	if(player_collide_object(C_RIGHT) && image_xscale = 1 || player_collide_object(C_LEFT) && image_xscale = -1 )
	{
		play_sound(sfx_spike);
		player_hurt(center_x);
	}