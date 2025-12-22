if (global.water_running_effect == 0){
	var count = sprite_get_number(spr_hydroplaning)
	
	draw_sprite_ext(spr_hydroplaning,( FRAME_TIMER / 4) mod count,
	obj_player.x - (19 * obj_player.facing), obj_water.y,
	obj_player.facing,1,0,c_white,1)
}