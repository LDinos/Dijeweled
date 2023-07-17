/// @description Insert description here
objectives = 0

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Objectives"
		var e = ini_read_real(s,"num_objectives",1)
		for(var i = 1; i <= e; i++)
		{
			var hover = ini_read_real(s,"objective_"+string(i),0)
			var TXT = string(ini_read_real(s,"value_"+string(i),0))
			var isticked = ini_read_real(s,"isticked_"+string(i),0)
			var nameinfo = ini_read_string(s,"name_"+string(i),"error")
			var str = "nada"
			if ini_key_exists(s,"board_"+string(i))
			{
				str = ini_read_string(s,"board_"+string(i),"error")	
			}
			#region setup objectives
				#region find type
					var type = 0 //blue nothing
					if (hover > 41) type = 1 //red 
					else if (hover !=0) && (hover != 36) type = 3 //typer
					else if (hover !=0) type = 2 //pencil
					
					#endregion
					#region find if hasinput
					var inp = false
					if (type = 3) || (hover == 44) || (hover == 45) || (hover == 48) inp = true
				#endregion
	
				with(obj_CUS_newobj)
				{
					if e > 3 enabled = false
					obj_CUS_objectives.objectives++
					var delat = instance_create_depth(x,y-16,-2,obj_CUS_delatobj)
					delat.index = obj_CUS_objectives.objectives
					var delat = instance_create_depth(x,y-16,-1,CUS_objective)
					delat.index = obj_CUS_objectives.objectives
					delat.text = nameinfo
					delat.text2 = TXT
					delat.on_focus = false
					delat.image_index = type
					delat.hasinput = inp
					delat.hover = hover
					if (hover = 42) || (hover = 46)
					{
						delat.amticked = isticked
						delat.hastickbox = true
						delat.texttickbox = "Ends game"
					}
					if str != "nada" ds_grid_read(delat.board,str)
					y = obj_CUS_objectives.y + 48 + (obj_CUS_objectives.objectives *5*16)
				}
				obj_CUS_general.canclick = true
			#endregion
		}
	ini_close()
}