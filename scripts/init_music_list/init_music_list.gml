function init_music_list()
{
	//Menu background music:
	//None here either!
	
	//Stage background music:
	//None here!
	
	//Game jingles:
	music_add(MUSIC.MENU, bgm_menu, 0.565);
	music_add(MUSIC.J_GAME_OVER, j_game_over, 0.00, 0.00, false);
	music_add(MUSIC.J_INVINCIBLE, j_invincible, 0.00, 0.00, false);
	music_add(MUSIC.J_SPEEDSHOE, j_speedshoe, 0.00, 0.00, false);
	music_add(MUSIC.J_ACT_CLEAR, j_zone_complete, 0.00, 0.00, false);
	music_add(MUSIC.SUPER, j_super, 0.565);
	music_add("FOREGONE DESTRUCTION - MICHIEL VAN DEN BOS", bgm_foregone, 0.000);
	music_add("ARBOREAL 1", bgm_arboreal_agate1);
	music_add("ARBOREAL 2", bgm_arboreal_agate2);
	music_add("BONUS", bgm_bonus, 16.657, 92.33, true);
}

	//Setup enum for music ID
	enum MUSIC {
		MENU,
		J_GAME_OVER,
		J_INVINCIBLE,
		J_SPEEDSHOE,
		J_ACT_CLEAR,
		SUPER,
	}
