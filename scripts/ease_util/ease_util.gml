function easeInOutCubic(val) {
	return val < 0.5 ? 4 * val * val * val : 1 - power(-2 * val + 2, 3) / 2;
}

function easeOutQuart(val) {
	return 1 - power(1 - val, 4);
}

function easeInQuad(v) {
	return v * v;
}

function easeOutElastic(val) 
{
	var c4 = (2 * pi) / 3;

	return power(2, -10 * val) * sin((val * 10 - 0.75) * c4) + 1;

}