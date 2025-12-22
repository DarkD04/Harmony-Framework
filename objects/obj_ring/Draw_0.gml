/// @description Draw rings

	if(!ringloss || ringloss && timer < 200 || ringloss && timer >= 200 && FRAME_TIMER mod 4 >= 2) draw_self();