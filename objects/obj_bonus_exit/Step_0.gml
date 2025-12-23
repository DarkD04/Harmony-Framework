if point_in_rectangle(obj_player.x, obj_player.y,bbox_left,bbox_top,bbox_right,bbox_bottom) {
	obj_player.visible = false;	
	obj_player.x_speed = 0;
	obj_player.y_speed = 0;
	
	if (global.bonus_stage_state == BONUSSTAGE.INSIDE) {
		global.bonus_stage_state = BONUSSTAGE.LEAVING;	
	}
}