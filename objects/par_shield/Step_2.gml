/// @description Position and hide
	x = floor(obj_player.x);
	y = floor(obj_player.y);
	
	//Don't make it appear or usable when player is inbincible
	if (obj_player.invincible) 
	{
		shield_state = 0;
		use_allow = false;
		visible = false
	}
	else
	{
		use_allow = true;
	}
	
	//Disable when player is not sonic
	if(obj_player.character != CHAR_SONIC)
	{
		use_allow = false;
		shield_state = false;
	}