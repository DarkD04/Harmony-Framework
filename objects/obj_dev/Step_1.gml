/// @description Dev menu

	if(keyboard_check_pressed(vk_escape) && !instance_exists(obj_devmenu)){
		var Menu = instance_create_depth(0, 0, -99999, obj_devmenu)
		Menu.CoolDown = 5;
	}