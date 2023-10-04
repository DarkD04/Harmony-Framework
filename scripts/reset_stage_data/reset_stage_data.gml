function reset_stage_data(){
	global.checkpoint_id = noone;
	global.time_store = 0;
	global.rings = 0;
	global.stage_timer = 0;
	ds_list_clear(global.checkpoint);
}