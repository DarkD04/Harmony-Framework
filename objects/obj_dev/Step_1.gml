/// @description Dev menu

	if(keyboard_check_pressed(vk_escape) && !instance_exists(DevMenu)){
		var Menu = instance_create_depth(0, 0, -99999, DevMenu)
		Menu.CoolDown = 5;
	}