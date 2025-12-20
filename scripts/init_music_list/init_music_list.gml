function init_music_list()
{
	//Menu background music:
	//None here either!
	
	//Stage background music:
	//None here!
	
	//Game jingles:
	music_add(MUSIC.MENU, bgm_menu, 0.000);
	music_add(MUSIC.J_GAME_OVER, j_game_over, 0.00, 0.00, false);
	music_add(MUSIC.J_INVINCIBLE, j_invincible, 0.00, 0.00, false);
	music_add(MUSIC.J_SPEEDSHOE, j_speedshoe, 0.00, 0.00, false);
	music_add(MUSIC.J_ACT_CLEAR, jingle_zone_complete, 0.00, 0.00, false);
	music_add("FOREGONE DESTRUCTION - MICHIEL VAN DEN BOS", bgm_foregone, 0.000);
}

	//Setup enum for music ID
	enum MUSIC {
		MENU,
		J_GAME_OVER,
		J_INVINCIBLE,
		J_SPEEDSHOE,
		J_ACT_CLEAR,
	}
