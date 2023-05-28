/// @description Values

DisableInput = false;

Up = keyboard_check((global.up))
Down = keyboard_check((global.down))
Left = keyboard_check((global.left))
Right = keyboard_check((global.right))
A = keyboard_check((global.a))
B = keyboard_check((global.b))
C = keyboard_check((global.c))
Action = keyboard_check((global.a)) || keyboard_check((global.b)) || keyboard_check((global.c))
Start = keyboard_check((global.start))

//Pressed
UpPress = keyboard_check_pressed((global.up))
DownPress = keyboard_check_pressed((global.down))
LeftPress = keyboard_check_pressed((global.left))
RightPress = keyboard_check_pressed((global.right))
APress = keyboard_check_pressed((global.a))
BPress = keyboard_check_pressed((global.b))
CPress = keyboard_check_pressed((global.c))
ActionPress = keyboard_check_pressed((global.a)) || keyboard_check_pressed((global.b)) || keyboard_check_pressed((global.c))
StartPress = keyboard_check_pressed((global.start))