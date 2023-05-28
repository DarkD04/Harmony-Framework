function player_state_normal(){
	//Stop executing if its not the specific state:
	if(state != ST_NORMAL) exit;
	
	//Change animations:
	if(ground)
	{
		//Default animation:
		animation = ANIM_STAND;
		
		//Walking animation:
		if(ground_speed != 0 || animation = ANIM_SKIDTURN)
		{
			animation = ANIM_WALK;
			animation_speed = 0.05+abs(ground_speed/20);
		}
		
		//Running animation:
		if(abs(ground_speed) >= 6)
		{
			animation = ANIM_RUN;
			animation_speed = 0.1+abs(ground_speed/16);
		}
		
		//Running animation:
		if(abs(ground_speed) >= 12)
		{
			animation = ANIM_MAXRUN;
		}
	}
}