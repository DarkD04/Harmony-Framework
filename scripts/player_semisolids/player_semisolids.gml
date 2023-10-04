function player_semisolids(){
	platform_check = true;
	
	//Disable collision
	if(layer_exists(global.col_tile[1]))
	{
		if(collision_rectangle(floor(x)-hitbox_w,floor(y)-hitbox_h,floor(x)+hitbox_w,floor(y),layer_tilemap_get_id(global.col_tile[1]),true,true) ||
		mode != 0 || y_speed <= 0 && !ground)
		{
			platform_check = false;
		}
	}
	//NEW METHOD! [Always trigger flag back]
	with(par_solid){
		if(collision_type = "Semi Solid"){
			platform_check = true;	
			
			//Check if player is colliding from the top
			if(player_collide_object(C_TOP) || other.mode != 0 || other.y_speed <= 0 && !other.ground){
				platform_check = false;	
			}
		}
	}
	
}