function init_music_list()
{
	//Menu background music:
	music_add(BGM_MENU, bgm_menu, 0.565);
	
	//Stage background music:
	music_add(BGM_ARBOREAL_1, bgm_arboreal_agate1);
	music_add(BGM_ARBOREAL_2, bgm_arboreal_agate2);
	
	//Game jingles:
	music_add(J_GAME_OVER, j_game_over, 0.00, 0.00, false);
	music_add(J_INVINCIBLE, j_invincible, 0.00, 0.00, false);
	music_add(J_SPEEDSHOE, j_speedshoe, 0.00, 0.00, false);
	music_add(J_ACT_CLEAR, jingle_zone_complete, 0.00, 0.00, false);
}

	//Setup macros for music ID
	#macro BGM_MENU 0
	#macro BGM_ARBOREAL_1 1
	#macro BGM_ARBOREAL_2 2
	#macro J_GAME_OVER 3
	#macro J_INVINCIBLE 4
	#macro J_SPEEDSHOE 5
	#macro J_ACT_CLEAR 6
