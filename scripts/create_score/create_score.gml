function create_score(offx = 0, offy = 0){
	//Crate score object
	var Object = instance_create_depth(x+offx, y+offy, depth-1, obj_score_effect);
	
	//Add score depending on the chain
	if(obj_level.badnik_chain = 1){
		Object.image_index = 0;
		global.score += 100;
	}
	
	if(obj_level.badnik_chain = 2){
		Object.image_index = 1;
		global.score += 200;
	}
	
	if(obj_level.badnik_chain = 3){
		Object.image_index = 2;
		global.score += 500;
	}
	
	if(obj_level.badnik_chain >= 4 && obj_level.badnik_chain <= 15){
		Object.image_index = 3;
		global.score += 1000;
	}
	
	if(obj_level.badnik_chain >= 16){
		Object.image_index = 4;
		global.score += 10000;
	}
}