image_speed=0
card=[]
price =""
function setCard (code)
{
	card = string_split(code, "?")
	price = string(card[1])
	switch (card[0])
	{
		case "CD1": //SHINE ON YOU CRAZY DIAMOND I
			image_index=1
		break
		
		case "KQ1": //KILLER QUEEN I
			image_index=2
		break
		
		case "SE1":
			image_index=3
		break
	}
}




