/// @description Disable ceiling landing
	if(player_collide_object(C_TOP_EXT))
	{
		obj_player.ceiling_allow = false;
	}