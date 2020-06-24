///@param Gamerule
var kek = argument0
var ix = find_gemfallen_posi(id,kek)
var jx = find_gemfallen_posj(id,kek)
var myflag = false

//x\\
if jx >= 1 && jx <=kek.board_xsize-2
{
	if kek.gemboard[ix,jx-1] == kek.gemboard[ix,jx+1] && kek.gemboard[ix,jx-1] == skinnum
	{
		if skinnum != 7
		{
		myflag = true
		other.flag = true
		}
	}
}

if jx >= 2
{
	if kek.gemboard[ix,jx-1] == kek.gemboard[ix,jx-2] && kek.gemboard[ix,jx-1] == skinnum
	{
		if skinnum != 7
		{
		myflag = true
		other.flag = true
		}
	}
}

if jx <= kek.board_xsize-3
{
	if kek.gemboard[ix,jx+1] == kek.gemboard[ix,jx+2] && kek.gemboard[ix,jx+1] == skinnum
	{
		if skinnum != 7
		{
		myflag = true
		other.flag = true
		}
	}
}

//y\\
if ix >= 1 && ix <= global.board_rows-2
{
	if kek.gemboard[ix-1,jx] == kek.gemboard[ix+1,jx] && kek.gemboard[ix-1,jx] == skinnum
	{
		if skinnum != 7
		{
		myflag = true
		other.flag = true
		}
	}
}

if ix >= 2
{
	if kek.gemboard[ix-1,jx] == kek.gemboard[ix-2,jx] && kek.gemboard[ix-1,jx] == skinnum
	{
		if skinnum != 7
		{
		myflag = true
		other.flag = true
		}
	}
}

if ix <= global.board_rows-3
{
	if kek.gemboard[ix+1,jx] == kek.gemboard[ix+2,jx] && kek.gemboard[ix+1,jx] == skinnum
	{
		if skinnum != 7
		{
		myflag = true
		other.flag = true
		}
	}
}

//myflag\\
if myflag
{
	with(kek) increase_xplier = true
}
