var l1 = layer_background_get_id(layer_get_id("bg_BOT"))
var l2 = layer_background_get_id(layer_get_id("Backgrounds_1"))

switch bkg
{
	case 0:
		layer_background_alpha(l2,1)
		layer_background_sprite(l1,spr_zenbkg_00a)
		layer_background_sprite(l2,spr_zenbkg_00b)
		layer_background_htiled(l2,true)
		break;
	case 1:
		layer_background_alpha(l2,1)
		layer_background_sprite(l1,spr_zenbkg_01a)
		layer_background_sprite(l2,spr_zenbkg_01b)
		layer_background_htiled(l2,true)
		break;
	case 2:
		layer_background_alpha(l2,1)
		layer_background_sprite(l1,spr_zenbkg_02a)
		layer_background_sprite(l2,spr_zenbkg_02b)
		layer_background_htiled(l2,true)
		break;
	case 3:
		layer_background_alpha(l2,1)
		layer_background_sprite(l1,spr_zenbkg_03a)
		layer_background_sprite(l2,spr_zenbkg_03b)
		layer_background_htiled(l2,true)
		break;
	case 4:
		layer_background_alpha(l2,1)
		layer_background_sprite(l1,spr_zenbkg_04a)
		layer_background_sprite(l2,spr_zenbkg_04b)
		layer_background_htiled(l2,true)
		break;
	case 5:
		layer_background_alpha(l2,0)
		layer_background_sprite(l1,spr_zenbkg_05)
		break;
	case 6:
		layer_background_alpha(l2,0)
		layer_background_sprite(l1,spr_zenbkg_06)
		break;
	case 7:
		layer_background_alpha(l2,0)
		layer_background_sprite(l1,spr_zenbkg_07)
		break;
	case 8:
		layer_background_alpha(l2,0)
		layer_background_sprite(l1,spr_zenbkg_08)
		break;
	case 9:
		layer_background_alpha(l2,0)
		layer_background_sprite(l1,spr_zenbkg_09)
		break;
	case 10:
		layer_background_alpha(l2,0)
		layer_background_sprite(l1,spr_zenbkg_10)
		break;
	case 11:
		layer_background_alpha(l2,0)
		layer_background_sprite(l1,spr_zenbkg_11)
		break;
	case 12:
		layer_background_alpha(l2,0)
		layer_background_sprite(l1,spr_zenbkg_12)
		break;
	default:
		bkg = 0
		layer_background_alpha(l2,1)
		layer_background_sprite(l1,spr_zenbkg_00a)
		layer_background_sprite(l2,spr_zenbkg_00b)
		layer_background_htiled(l2,true)
		break;
}