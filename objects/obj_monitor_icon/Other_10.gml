/// @description Rewards
	switch(monitor_type)
	{
		case "10 Rings":
			global.rings += 10;
			play_sound(sfx_superring);
		break;
		
		case "Shield":
			obj_player.shield = S_NORMAL;
			play_sound(sfx_shield);
		break;
		
		case "Electric Shield":
			obj_player.shield = S_ELECTRIC;
			play_sound(sfx_shieldelec);
		break;
		
		case "Fire Shield":
			obj_player.shield = S_FIRE;
			play_sound(sfx_shieldfire);
		break;
		
		case "Bubble Shield":
			obj_player.shield = S_BUBBLE;
			play_sound(sfx_shieldbubble);
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
		
		case "Eggman":
			obj_player.knockout_type = K_HURT;
		break;
		
		case "Extra Life":
			play_sound(j_extra_life);
			global.life += 1;
		break;
	}