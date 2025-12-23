/// @description Game events
	
	//check if the player needs to enter the bonus stage
	if (global.bonus_stage_state == BONUSSTAGE.GOING_TO){
		if (!bonus_stage_trigger){
			obj_player.input_disable = true
			play_sound(sfx_warp_into)
			fade_change(FADE_OUT, 2, FADE_WHITE, 30)
			music_fade_channel(BGM, FADE_OUT, 3)
			
			global.store_player_state.combinering = obj_player.combinering
			global.store_player_state.shield = obj_player.shield
			global.store_player_state.rings = global.rings
			global.previous_room = room
			
			global.process_objects = false
			bonus_stage_trigger = true
		} else {
			if (obj_fade.fade_timer == 0 && obj_fade.fade_buffer == 0) {
				global.bonus_stage_state = BONUSSTAGE.INSIDE
				global.process_objects = true
				room_goto(rm_bonus)
				bonus_stage_trigger = false
			}
		}
	}
	//check for leaving
	if (global.bonus_stage_state == BONUSSTAGE.LEAVING){
		if (!bonus_stage_trigger){
			obj_player.input_disable = true
			fade_change(FADE_OUT, 2, FADE_BLACK, 10)
			music_fade_channel(BGM, FADE_OUT, 3)
			
			global.store_player_state.combinering = obj_player.combinering
			global.store_player_state.shield = obj_player.shield
			global.store_player_state.rings = global.rings
			
			global.process_objects = false
			bonus_stage_trigger = true
		} else {
			if (obj_fade.fade_timer == 0 && obj_fade.fade_buffer == 0) {
				global.bonus_stage_state = BONUSSTAGE.INSIDE
				global.process_objects = true
				room_goto(global.previous_room)
				bonus_stage_trigger = false
			}
		}
	}
	
	
	//Suspend everything in here if objects are not processed anymore
	if(!global.process_objects)
	{
		exit;	
	}
	
	//Add the frame timer
	global.object_timer++;