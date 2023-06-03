/// @description Shield reposition

	// Inherit the parent event
	event_inherited();
	
	//I hate this
	back.x = x;
	back.y = y;
		
	//flicker effect (i love code repositioning!)
	flickercount = (flickercount + 1) mod 4;
	
	if (shield_state = 0 && !obj_player.invincible)
	{
		if (flickercount < 2)
		{
			back.visible = false;
			visible = true;
		} else
		{
			back.visible = true;
			visible = false;
		}
	}