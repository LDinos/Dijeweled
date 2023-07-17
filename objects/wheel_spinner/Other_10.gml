audio_stop_sound(siren)
victory = true
/*Cases in which we lose*/
if danger = 1
    {
    if ( rot > 67.5 && rot <= 112.5 ) //68.5, 112
        {
        victory = false
        }    
    }
else if danger = 2
    {
    if (rot>22.5 && rot <=112.5) //22.5, 111.5
        {
        victory = false
        }
    }
else
    {
    if ( rot>22.5 && rot <=157.5 ) //22.5, 157.5
        {
        victory = false
        }
    }
alarm[5] = 5


/* */
/*  */
