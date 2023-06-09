/// @description Script

	
	if(global.object_timer mod 180 = 0 || global.object_timer mod 180 = 40){
		var bubble = instance_create_depth(x, y-4, depth-1, obj_bubble);
		bubble.type = 0;	
		bubble.angle = random(360);
	}
	
	if(global.object_timer mod 240 = 20){
		var bubble = instance_create_depth(x, y-4, depth-1, obj_bubble);
		bubble.type = 1;	
		bubble.angle = random(360);
	}
	
	if(global.object_timer mod 360 = 80){
		var bubble = instance_create_depth(x, y-4, depth-1, obj_bubble);
		bubble.type = 2;	
		bubble.angle = random(360);
	}