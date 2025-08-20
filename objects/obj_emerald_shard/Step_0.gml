//Collect
if(player_collide_object(C_MAIN) && obj_player.state != player_state_knockout && !collected && !hidden_within)
{
	collected = true
	audio_stop_sound(sfx_radar_ding)
	play_sound(sfx_shard_collect)
}

if (hidden_within) {
	visible = false	
}


if (!collected){
	distance_from = distance_to_object(obj_player);
	
	distance_stages = 5 - floor(min(sqrt(distance_from) / 5,5))
	//show_debug_message(sqrt(distance_from) / 4)
}