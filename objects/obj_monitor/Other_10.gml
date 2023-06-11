/// @description Monitor icons
	switch(monitor_type)
	{
		case "10 Rings": monitor_icon = spr_monitor_icon_10ring; break;
		case "Shield": monitor_icon = spr_monitor_icon_shield; break;
		case "Fire Shield": monitor_icon = spr_monitor_icon_fire_shield; break;
		case "Electric Shield": monitor_icon = spr_monitor_icon_electric_shield; break;
		case "Bubble Shield": monitor_icon = spr_monitor_icon_bubble_shield; break;
		case "Invincible": monitor_icon = spr_monitor_icon_inv; break;
		case "Speed Shoes": monitor_icon = spr_monitor_icon_shoes; break;
		case "Extra Life": 
			switch(global.character)
			{
				case CHAR_SONIC: monitor_icon = spr_monitor_icon_life_sonic; break;
				case CHAR_TAILS: monitor_icon = spr_monitor_icon_life_tails; break;
				case CHAR_KNUX: monitor_icon = spr_monitor_icon_life_knuckles; break;
			}
		break;
		case "Eggman": monitor_icon = spr_monitor_icon_eggman; break;
	} 