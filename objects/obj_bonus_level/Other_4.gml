// Inherit the parent event
	//Play stage music
	play_music("BONUS", BGM);
	
	//Reset stage data
	global.stage_timer = 0;
	
	if (global.bonus_stage_state != BONUSSTAGE.INSIDE) {
		global.bonus_stage_state = BONUSSTAGE.INSIDE;	
	}
	