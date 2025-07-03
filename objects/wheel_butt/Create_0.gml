clicked = 0
image_alpha= 0
image_speed = 0
image_xscale = .75
image_yscale = .75
amready = 0

function press() {
	if !Gamerule_1.isReplay {
		if (amready == 1) event_user(0)
	}
}
