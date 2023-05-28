function angle_sensor_position(){
var tile_x;
	
	//Only for ceiling landing
	if(!ground){
		if line_check(-hitbox_w,-hitbox_h-1, true) && !line_check(hitbox_w,-hitbox_h-1, true){
			tile_x = -hitbox_w+x;
			point_x[0] = 16*floor(tile_x/16)+15
			point_x[1] = 16*floor(tile_x/16)
			point_y[0] = floor(y);
			point_y[1] = floor(y);
		}
		
		if !line_check(-hitbox_w,-hitbox_h-1, true) && line_check(hitbox_w,-hitbox_h-1, true){
			tile_x = hitbox_w+x;
			point_x[0] = 16*floor(tile_x/16)+15
			point_x[1] = 16*floor(tile_x/16)
			point_y[0] = floor(y);
			point_y[1] = floor(y);
		}
	}
	
	//Ground
	if(ground){
		switch(mode){
			case 0:
			if line_check(-hitbox_w,hitbox_h+1, true) && line_check(hitbox_w,hitbox_h+1, true){
				point_x[0] = floor(x)-hitbox_w
				point_x[1] = floor(x)+hitbox_w
				point_y[0] = floor(y);
				point_y[1] = floor(y);
			}
		
			if line_check(-hitbox_w,hitbox_h+1, true) && !line_check(hitbox_w,hitbox_h+1, true){
				tile_x = -hitbox_w+x;
				point_x[0] = 16*floor(tile_x/16)
				point_x[1] = 16*floor(tile_x/16)+15
				point_y[0] = floor(y);
				point_y[1] = floor(y);
			}
		
			if !line_check(-hitbox_w,hitbox_h+1, true) && line_check(hitbox_w,hitbox_h+1, true){
				tile_x = hitbox_w+x;
				point_x[0] = 16*floor(tile_x/16)
				point_x[1] = 16*floor(tile_x/16)+15
				point_y[0] = floor(y);
				point_y[1] = floor(y);
			}
		    break;
		
			case 1:
			if line_check(-hitbox_w,hitbox_h+1, true) && line_check(hitbox_w,hitbox_h+1, true){
				point_x[0] = floor(x)
				point_x[1] = floor(x)
				point_y[0] = floor(y)+hitbox_w;
				point_y[1] = floor(y)-hitbox_w;
			}
		
			if line_check(-hitbox_w,hitbox_h+1, true) && !line_check(hitbox_w,hitbox_h+1, true){
				tile_x = -hitbox_w+y;
				point_y[0] = 16*floor(tile_x/16)+31
				point_y[1] = 16*floor(tile_x/16)+16
				point_x[0] = floor(x);
				point_x[1] = floor(x);
			}
		
			if !line_check(-hitbox_w,hitbox_h+1, true) && line_check(hitbox_w,hitbox_h+1, true){
				tile_x = -hitbox_w+y;
				point_y[0] = 16*floor(tile_x/16)+15
				point_y[1] = 16*floor(tile_x/16)
				point_x[0] = floor(x);
				point_x[1] = floor(x);
			}
		    break;
		
			case 2:
			if line_check(-hitbox_w,hitbox_h+1, true) && line_check(hitbox_w,hitbox_h+1, true){
				point_x[0] = floor(x)+hitbox_w
				point_x[1] = floor(x)-hitbox_w
				point_y[0] = floor(y);
				point_y[1] = floor(y);
			}
		
			if line_check(-hitbox_w,hitbox_h+1, true) && !line_check(hitbox_w,hitbox_h+1, true){
				tile_x = -hitbox_w+x;
				point_x[0] = 16*floor(tile_x/16)+15
				point_x[1] = 16*floor(tile_x/16)
				point_y[0] = floor(y);
				point_y[1] = floor(y);
			}
		
			if !line_check(-hitbox_w,hitbox_h+1, true) && line_check(hitbox_w,hitbox_h+1, true){
				tile_x = hitbox_w+x;
				point_x[0] = 16*floor(tile_x/16)+15
				point_x[1] = 16*floor(tile_x/16)
				point_y[0] = floor(y);
				point_y[1] = floor(y);
			}
		    break;
			case 3:
			if line_check(-hitbox_w,hitbox_h+1, true) && line_check(hitbox_w,hitbox_h+1, true){
				point_x[0] = floor(x)
				point_x[1] = floor(x)
				point_y[0] = floor(y)-hitbox_w;
				point_y[1] = floor(y)+hitbox_w
			}
		
			if line_check(-hitbox_w,hitbox_h+1, true) && !line_check(hitbox_w,hitbox_h+1, true){
				tile_x = -hitbox_w+y;
				point_y[0] = 16*floor(tile_x/16)
				point_y[1] = 16*floor(tile_x/16)+15
				point_x[0] = floor(x);
				point_x[1] = floor(x);
			}
		
			if !line_check(-hitbox_w,hitbox_h+1, true) && line_check(hitbox_w,hitbox_h+1, true){
				tile_x = hitbox_w+y;
				point_y[0] = 16*floor(tile_x/16)
				point_y[1] = 16*floor(tile_x/16)+15
				point_x[0] = floor(x);
				point_x[1] = floor(x);
			}
		    break;
	
		}
	}
}