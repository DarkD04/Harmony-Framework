function player_state_normal(){
	//Stop executing if its not the specific state:
	if(state != ST_NORMAL) exit;
	
	//Change animations:

		//Default animation:
		if (ground)
		{
			animation = ANIM_STAND;
		}
		
		//Walking animation:
		if(ground_speed != 0 || animation = ANIM_SKIDTURN)
		{
			animation = ANIM_WALK;
			animation_set_speed = floor(max(0, 8-abs(obj_player.ground_speed)));//mfw im an accuracy whore
		}
		
		//Running animation:
		if(abs(ground_speed) >= 6)
		{
			animation = ANIM_RUN;
			switch(character)
			{
				case CHAR_TAILS: animation_set_speed = 1; break;
				default: animation_set_speed = floor(max(0, 8-abs(obj_player.ground_speed))); break;
			}
		}
		
		//Running animation:
		if(abs(ground_speed) >= 12)
		{
			animation = ANIM_MAXRUN;
			animation_set_speed = 1;
		}
	
}