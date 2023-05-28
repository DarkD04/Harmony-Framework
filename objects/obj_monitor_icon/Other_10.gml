/// @description Rewards
	switch(monitor_type)
	{
		case "10 Rings":
			global.rings += 10;
			play_sound(sfx_superring);
		break;
		
		case "Shield":
			obj_player.shield = S_NORMAL;
		break;
		
		case "Electric Shield":
			obj_player.shield = S_ELECTRIC;
		break;
		
		case "Fire Shield":
			obj_player.shield = S_FIRE;
		break;
		
		case "Bubble Shield":
			obj_player.shield = S_BUBBLE;
		break;
		
		case "Invincible":
			obj_player.invincible = true
			obj_player.invincible_timer = 1200;
			play_music(j_invincible, Jingle, 0, 0, false);
		break;
		
		case "Speed Shoes":
			obj_player.speed_shoes = 1200;
			play_music(j_speedshoe, Jingle, 0, 0, false);
		break;
	}