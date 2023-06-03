function player_semisolids(){
	platform_check = true;
	
	//Disable collision
	if(mode != 0){
		if(mode != 0 || y_speed <= 0 && !ground)
			platform_check = false;
	}else{
		//NEW METHOD! [Always trigger flag back]
		with(par_solid){
			if(collision_type = "Semi Solid"){
				platform_check = true;	
			
				//Check if player is colliding from the top
				if(player_collide_object(C_TOP)){
					platform_check = false;	
				}
			}
		}
	}
}