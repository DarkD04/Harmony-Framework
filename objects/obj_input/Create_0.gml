/// @description Values
	Up = keyboard_check((global.up))
	Down = keyboard_check((global.down))
	Left = keyboard_check((global.left))
	Right = keyboard_check((global.right))
	A = keyboard_check((global.a))
	B = keyboard_check((global.b))
	C = keyboard_check((global.c))
	Action = A || B || C;
	Start = keyboard_check((global.start))

	//Pressed:
	UpPress = keyboard_check_pressed((global.up))
	DownPress = keyboard_check_pressed((global.down))
	LeftPress = keyboard_check_pressed((global.left))
	RightPress = keyboard_check_pressed((global.right))
	APress = keyboard_check_pressed((global.a))
	BPress = keyboard_check_pressed((global.b))
	CPress = keyboard_check_pressed((global.c))
	ActionPress = APress || BPress || CPress;
	StartPress = keyboard_check_pressed((global.start))
	
	//Analog input presses:
	axis_left_press = false;
	axis_right_press = false;
	axis_up_press = false;
	axis_down_press = false;
	
	//Releaseed:
	UpRelease = keyboard_check_released((global.up))
	DownRelease = keyboard_check_released((global.down))
	LeftRelease = keyboard_check_released((global.left))
	RightRelease = keyboard_check_released((global.right))
	ARelease = keyboard_check_released((global.a))
	BRelease = keyboard_check_released((global.b))
	CRelease = keyboard_check_released((global.c))
	ActionRelease = ARelease || BRelease || CRelease;
	StartRelease = keyboard_check_released((global.start))
	
	//Analog input Releasees:
	axis_left_release = false;
	axis_right_release = false;
	axis_up_release = false;
	axis_down_release = false;
	
	//Analog deadzone:
	deadzone_x = 0.7;
	deadzone_y = 0.4;
	
	//Vibration values:
	vibration_timer = 0;
	vibration_strenght = 0;
	
	//Gamepad slot value:
	global.gamepad_slot = 0;