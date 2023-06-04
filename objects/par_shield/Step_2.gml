/// @description Position and hide
	//x = floor(obj_player.x);
	//y = floor(obj_player.y);
	
	x = floor((obj_player.bbox_left) + (obj_player.bbox_right-obj_player.bbox_left)/2);
	y = floor((obj_player.bbox_top) + (obj_player.bbox_bottom-obj_player.bbox_top)/2);
	
	//Don't make it appear or usable when player is inbincible
	if (obj_player.invincible) 
	{
		shield_state = 0;
		use_allow = false;
		visible = false
	}else
	{
		use_allow = true;
	}
	
	//Disable when player is not sonic
	if(obj_player.character != CHAR_SONIC)
	{
		use_allow = false;
		shield_state = false;
	}