/// @description Draw sparkles
	
	if(mode = 0){
		if flicker = 0
		{
			for(var i = 0; i < 2; i++){
				draw_sprite(sprite_index, image_index, x+(16*dsin(angle - 180*i)), y+(16*dcos(angle - 180*i)))	
			}
		}else{
			for(var i = 0; i < 2; i++){
				draw_sprite(sprite_index, image_index+(image_number/2), x+(16*dsin(90- angle - 180*i)), y+(16*dcos(90- angle - 180*i)))	
			}
		}
	}
	
	
	for(var i = 0; i < 2; i++){
		if(mode = 1)
			draw_sprite(sprite_index, image_index+(image_number/2), x+(16*dsin(angle + 180*i)), y+(16*dcos(angle + 180*i)))	
		
		if(mode = 2)
			draw_sprite(sprite_index, image_index, x+(16*dsin(90+angle - 180*i)), y+(16*dcos(90+angle - 180*i)))	
	}