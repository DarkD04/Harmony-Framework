//Collect
if(player_collide_object(C_MAIN) && obj_player.state != player_state_knockout && !collected && !hidden_within)
{
	collected = true
	audio_stop_sound(sfx_radar_ding)
	play_sound(sfx_shard_collect)
	array_push(obj_level.emerald_array, 128)
	scale = 1;
}

if (hidden_within) {
	visible = false	
}


if (!collected){
	if (scale > 1) {
		if (distance_stages < 5) {
			scale = max(scale - 0.01, 1);
		} else {
			scale = max(scale - 0.025, 1);
		}
	}
	distance_from = distance_to_object(obj_player);
	
	distance_stages = 5 - floor(min(sqrt(distance_from) / 5,5))
	//show_debug_message(sqrt(distance_from) / 4)
}