/// @description Insert description here
// You can write your code in this editor

// Draw elements based on BG mode
// THIS NEEDS TO BE ABOVE INHERITED EVENT!

if bg_mode == 0 {
	visibility[13] = false;
	visibility[14] = false;
}
else {
	visibility[13] = true;
	visibility[14] = true;
}

// Inherit the parent event
event_inherited();

