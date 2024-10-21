function create_effect(X, Y, sprite, anim_speed, obj_depth = depth - 1, x_speed = 0, y_speed = 0, x_accel = 0, y_accel = 0){
	//Create and get the object
	var Object = instance_create_depth(X, Y, obj_depth, obj_effect);
	
	//Set the sprite and animation speed
	Object.sprite_index = sprite;
	Object.image_speed = anim_speed;
	
	//Physics properties
	Object.x_speed = x_speed;
	Object.y_speed = y_speed;
	Object.x_accel = x_accel;
	Object.y_accel = y_accel;
	
	//Return the instance
	return Object;
}