/// @description
if (animate) {
	alpha = lerp(min_alpha, max_alpha, lerp_alpha)
	lerp_alpha += 0.05 * (-lerp_backwards)

	if (lerp_alpha >= max_alpha || lerp_alpha <= min_alpha) {
		lerp_backwards = !lerp_backwards
		lerp_alpha = clamp(lerp_alpha, min_alpha, max_alpha)
	}
}
else alpha = 1
