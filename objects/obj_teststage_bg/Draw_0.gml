/// @description Insert description here
// You can write your code in this editor

// Draw elements based on BG mode
// THIS NEEDS TO BE ABOVE INHERITED EVENT!

if bg_mode == 0 {
	visibility[13] = false;
	visibility[14] = false;
	visibility[15] = false;
	visibility[16] = false;
}
else {
	visibility[13] = true;
	visibility[14] = true;
	visibility[15] = true;
	visibility[16] = true;
}

// Inherit the parent event
event_inherited();

//Water scale
	if visibility[16] == true {
	    var a = floor(camera_get_view_y(view_camera[view_current])*factor_y[16] + offset_y[16]); //"16" is the index of the water's parallax
	    bg_scale[16] = floor(obj_water.y - a) * (1 / 96); //"96" is the water parallax sprite's height
	    bg_scale[16] = clamp(bg_scale[16], -1, 1);
	}
