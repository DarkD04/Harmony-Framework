function reset_stage_data(){
	global.checkpoint_id = noone;
	global.time_store = 0;
	global.rings = 0;
	global.stage_timer = 0;
	ds_list_clear(global.checkpoint);
	ds_list_clear(global.store_object_state)
	global.store_player_state.rings = 0
	global.store_player_state.combinering = 0
	//you may optionally want to clear the shield in store_player_state
	//do note this only runs when a stage is fully reset or loaded for this first time
}