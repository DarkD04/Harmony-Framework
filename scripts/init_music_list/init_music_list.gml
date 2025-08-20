function init_music_list()
{
	//Menu background music:
	music_add(MUSIC.MENU, bgm_menu, 0.565);
	
	//Stage background music:
	music_add(MUSIC.ARBOREAL_1, bgm_arboreal_agate1);
	music_add(MUSIC.ARBOREAL_2, bgm_arboreal_agate2);
	music_add(MUSIC.BRIDGE, bgm_bridge);
	
	//Game jingles:
	music_add(MUSIC.J_GAME_OVER, j_game_over, 0.00, 0.00, false);
	music_add(MUSIC.J_INVINCIBLE, j_invincible, 0.00, 0.00, false);
	music_add(MUSIC.J_SPEEDSHOE, j_speedshoe, 0.00, 0.00, false);
	music_add(MUSIC.J_ACT_CLEAR, jingle_zone_complete, 0.00, 0.00, false);
}

	//Setup enum for music ID
	enum MUSIC {
		MENU,	
		ARBOREAL_1,	
		ARBOREAL_2,	
		BRIDGE,	
		J_GAME_OVER,
		J_INVINCIBLE,
		J_SPEEDSHOE,
		J_ACT_CLEAR,
	}
