/// @description Insert description here
// You can write your code in this editor
if palette {
	palette_swap(palette_texture, palette_index)	
}

gpu_set_blendmode(blend);
draw_self();
gpu_set_blendmode(bm_normal)
shader_reset()