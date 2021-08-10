///@param difference
function matcher_script2(argument0) {
	var t = argument0
	var xxx = 0
	var yyy = 0
					if n2 >= 8
	                    {
	                    var sc = 1000                    
	                    points_add(sc,true)
						compliment_add(1500)
						var sx = gem_board1[j-5+t,i].x
						var sy = gem_board1[j-5+t,i].y
						create_score_text(sx,sy,sc,true,gem_board1[j-1+t,i].mycolor)
						if (combo >= 1) style_add(sc,true)
						if specials_allowed
						{
						var xxx = gem_board1[j-5+t,i].x
						var yyy = gem_board1[j-5+t,i].y
						}
                    
	                    with(gem_board1[j-1+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-2+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-3+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-4+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-5+t,i]) match_script(6)
	                    with(gem_board1[j-6+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-7+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-8+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    }                     
	                else if n2 = 7
	                    {
							var sc = 500
						if specials_allowed
						{
						var xxx = gem_board1[j-4+t,i].x
						var yyy = gem_board1[j-4+t,i].y
						}
	                    //audio_play_sound(gling,1,0)                    
	                    points_add(sc,true)
						compliment_add(1500)
						var sx = gem_board1[j-4+t,i].x
						var sy = gem_board1[j-4+t,i].y
						create_score_text(sx,sy,sc,true,gem_board1[j-1+t,i].mycolor)
						if (combo >= 1) style_add(sc,true)
                    
	                    with(gem_board1[j-1+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-2+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-3+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-4+t,i]) match_script(5)
	                    with(gem_board1[j-5+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-6+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-7+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    }
	                else if n2 = 6
	                    {
							if specials_allowed
						{
							var xxx = gem_board1[j-4+t,i].x
							var yyy = gem_board1[j-4+t,i].y
						}
	                    var sc = 250                  
	                    points_add(sc,true)
						compliment_add(1000)
						var sx = gem_board1[j-4+t,i].x
						var sy = gem_board1[j-4+t,i].y
						create_score_text(sx,sy,sc,true,gem_board1[j-1+t,i].mycolor)
						if (combo >= 1) style_add(sc,true)
                    
	                    with(gem_board1[j-1+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-2+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-3+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-4+t,i]) match_script(4)
	                    with(gem_board1[j-5+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-6+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    }
	                else if n2 = 5
	                    {
	                    var sc = 150                  
	                    points_add(sc,true)
						var sx = gem_board1[j-3+t,i].x
						var sy = gem_board1[j-3+t,i].y
						create_score_text(sx,sy,sc,true,gem_board1[j-1+t,i].mycolor)
						if (combo >= 1) style_add(sc,true)
					
						if specials_allowed
						{
						var xxx = gem_board1[j-3+t,i].x
						var yyy = gem_board1[j-3+t,i].y
						}
                   
	                    with(gem_board1[j-1+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-2+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-3+t,i]) match_script(3)
	                    with(gem_board1[j-4+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-5+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    }
	               else if n2 = 4
	                    {
	                    p1 = 1
	                    p2 = 0
	                    var sc = 125
	                    points_add(sc,true)
						var sx = gem_board1[j-3+t,i].x
						var sy = gem_board1[j-3+t,i].y
						create_score_text(sx,sy,sc,true,gem_board1[j-1+t,i].mycolor)
						if (combo >= 1) style_add(sc,true)
						retxx = 0
						retyy = 0
						retxx2 = 0
						retyy2 = 0
	                    check_powercenter(2,gem_board1[j-2+t,i],gem_board1[j-3+t,i])
						if p1 = 1
						{
							var xxx = retxx2
							var yyy = retyy2
						}
						else
						{
							var xxx = retxx
							var yyy = retyy
						}
						if !specials_allowed
						{
							retxx = 0
							retyy =0
							retxx2 = 0
							retyy2 = 0
							xxx = 0
							yyy = 0
						}
                    
	                    with(gem_board1[j-2+t,i]) {match_script(other.p1);  dragXX = other.retxx; dragYY = other.retyy;}
	                    with(gem_board1[j-3+t,i]) {match_script(other.p2); dragXX = other.retxx2; dragYY = other.retyy2; }
						with(gem_board1[j-1+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
	                    with(gem_board1[j-4+t,i]) {match_script(0);  dragXX = xxx; dragYY = yyy;}
					
	                    }                                                      
	                else if n2 = 3                                
	                    {
	                    var sc = 100             
	                    points_add(sc,true)
						var sx = gem_board1[j-2+t,i].x
						var sy = gem_board1[j-2+t,i].y
						create_score_text(sx,sy,sc,true,gem_board1[j-1+t,i].mycolor)
						if (combo >= 1) style_add(sc,true)
                    
	                    with(gem_board1[j-1+t,i]) match_script(0)
	                    with(gem_board1[j-2+t,i]) match_script(0)
	                    with(gem_board1[j-3+t,i]) match_script(0)
	                    }                        
	                n2 = 1


}
