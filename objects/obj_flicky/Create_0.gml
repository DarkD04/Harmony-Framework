/// @description Values
	//Animal macros
	#macro A_FLICKY 0
	#macro A_POCKY 1
	#macro A_CUCKY 2
	#macro A_RICKY 3
	#macro A_PECKY 4
	#macro A_ROCKY 5
	#macro A_PICKY 6
	
	//Randomize the animal
	random_animal = random(array_length(obj_level.animal));
	
	//Flicky values for different type
	animal_type = obj_level.animal[random_animal];
	animal_sprite = [spr_flicky, spr_pocky, spr_cucky, spr_ricky, spr_pecky, spr_rocky, spr_picky];
	grav_arr = [0.09375, 0.21875, 0.09375, 0.21875, 0.21875, 0.21875, 0.21875];
	jump_force = [4, 4, 3, 3.5, 3, 1.5, 3]
	accel = [3, 2, 2, 2.5, 1.5, 1.25, 1.75];
	
	//Change sprite
	sprite_index = animal_sprite[animal_type];
	
	//When creating
	y_speed = -4;
	grav = 0.21875;
	facing = 0;
	triggered = false;
	delay = 0;