ini_write_real("ver","value",5) //if u change that, change also on rm_menu 'var ver'
ini_write_real("hasseencredits","value",false)
#region Category Titles
ini_write_string("Titles","0","BOARD CLEANER 1")
ini_write_string("Titles","1","LOCKSMITH")
ini_write_string("Titles","2","MOVES INVESTOR")
ini_write_string("Titles","3","CASCADE CREATOR")
ini_write_string("Titles","4","PRESERVER")
ini_write_string("Titles","5","FRUGAL")
ini_write_string("Titles","6","4-GEM CREATOR")
ini_write_string("Titles","7","5-GEM CREATOR")
ini_write_string("Titles","8","SURVIVOR")
ini_write_string("Titles","9","TIME RUNNER")
ini_write_string("Titles","10","ICE LOCKSMITH")
ini_write_string("Titles","11","COAL DESTROYER")
ini_write_string("Titles","12","BOMB DESTROYER")
ini_write_string("Titles","13","6-GEM CREATOR")
ini_write_string("Titles","14","PATTERN DESIGNER")
ini_write_string("Titles","15","DETONATOR")
ini_write_string("Titles","16","CHAIN CREATOR")
ini_write_string("Titles","17","POINT SCORER")
ini_write_string("Titles","18","DOOM DESTROYER")
ini_write_string("Titles","19","PROTECTOR")
ini_write_string("Titles","20","SKULL DESTROYER")
ini_write_string("Titles","21","ENIGMA")
ini_write_string("Titles","22","BOARD CLEANER 2")
ini_write_string("Titles","23","ZENIFIER")
ini_write_string("Titles","24","PROFESSIONAL 1")
ini_write_string("Titles","25","PROFESSIONAL 2")
ini_write_string("Titles","26","CUSTOM")
#endregion

#region Challenge Descriptions
var i = 0
//0
ini_write_string("Challenges",string(i) + ":0","Clear all the gems") //1 M-UNTIMED
ini_write_string("Challenges",string(i) +":1","Clear all the gems") //1 M-UNTIMED
ini_write_string("Challenges",string(i) +":2","Clear all the gems") //2 M-UNTIMED
ini_write_string("Challenges",string(i) +":3","Clear all the gems") //2 M-UNTIMED
ini_write_string("Challenges",string(i) +":4","Clear all the gems") //3 M-UNTIMED
ini_write_string("Challenges",string(i) +":5","Clear all the gems") //3 M-UNTIMED
	i++
//1
ini_write_string("Challenges",string(i) + ":0","Destroy 10 locks in 3 minutes") //1
ini_write_string("Challenges",string(i) + ":1","Destroy 15 locks in 5 minutes") //1
ini_write_string("Challenges",string(i) + ":2","Destroy 35 locks in 5 minutes") //2
ini_write_string("Challenges",string(i) + ":3","Destroy 25 locks in 3 minutes") //2
ini_write_string("Challenges",string(i) + ":4","Destroy 15 locks in 1 minute") //2
ini_write_string("Challenges",string(i) + ":5","Destroy 40 locks in 3 minutes") //3
	i++
//2
ini_write_string("Challenges",string(i) + ":0","Have 15 possible matches") //1 M-UNTIMED
ini_write_string("Challenges",string(i) + ":1","Have 25 possible matches") //2 M-UNTIMED
ini_write_string("Challenges",string(i) + ":2","Have 31 possible matches") //3 M-UNTIMED
ini_write_string("Challenges",string(i) + ":3","Have 36 possible matches") //3 M-UNTIMED
ini_write_string("Challenges",string(i) + ":4","Have 30 possible matches in 1 minute") //4
ini_write_string("Challenges",string(i) + ":5","Have 40 possible matches in 1 minute") //5
	i++
//3
ini_write_string("Challenges",string(i) + ":0","Create 4 cascades") //1
ini_write_string("Challenges",string(i) + ":1","Create 6 cascades") //2
ini_write_string("Challenges",string(i) + ":2","Create 8 cascades") //3
ini_write_string("Challenges",string(i) + ":3","Create 10 cascades") //4
ini_write_string("Challenges",string(i) + ":4","Create 7 cascades in 1 minute") //5
ini_write_string("Challenges",string(i) + ":5","Create 12 cascades") //5
	i++
//4
ini_write_string("Challenges",string(i) + ":0","Get 12 green gems on board") //1
ini_write_string("Challenges",string(i) + ":1","Get 20 green gems on board") //1
ini_write_string("Challenges",string(i) + ":2","Get 28 green gems on board") //3
ini_write_string("Challenges",string(i) + ":3","Get 22 green gems and 22 red gems on board") //3
ini_write_string("Challenges",string(i) + ":4","Get 25 green gems on board in 1 minute") //3
ini_write_string("Challenges",string(i) + ":5","Get 30 green gems on board in 1 minute") //3
	i++
//5
ini_write_string("Challenges",string(i) + ":0","Destroy 50 gems in 20 moves") //1
ini_write_string("Challenges",string(i) + ":1","Destroy 80 gems in 20 moves") //2
ini_write_string("Challenges",string(i) + ":2","Make 5 lightning gems in 25 moves") //3
ini_write_string("Challenges",string(i) + ":3","Make a supernova in 16 moves") //4
ini_write_string("Challenges",string(i) + ":4","Match 150 gems in 30 moves") //4
ini_write_string("Challenges",string(i) + ":5","Match 200 gems in 30 moves") //5
	i++
//6
ini_write_string("Challenges",string(i) + ":0","Make 20 flame gems in 5 minutes") //1
ini_write_string("Challenges",string(i) + ":1","Make 18 flame gems in 3 minutes") //3 
ini_write_string("Challenges",string(i) + ":2","Make 28 flame gems in 3 minutes") //3 
ini_write_string("Challenges",string(i) + ":3","Make 40 flame gems in 3 minutes") //3
ini_write_string("Challenges",string(i) + ":4","Make 20 flame gems in 1 minute") //4
ini_write_string("Challenges",string(i) + ":5","Make 27 flame gems in 1 minute") //6
	i++
//7
ini_write_string("Challenges",string(i) + ":0","Make 15 lightning gems in 3 minutes") //1
ini_write_string("Challenges",string(i) + ":1","Make 21 lightning gems in 3 minutes") //2
ini_write_string("Challenges",string(i) + ":2","Make 25 lightning gems in 3 minutes") //3
ini_write_string("Challenges",string(i) + ":3","Make 30 lightning gems in 3 minutes") //3
ini_write_string("Challenges",string(i) + ":4","Make 15 lightning gems in 1 minute") //6
ini_write_string("Challenges",string(i) + ":5","Make 20 lightning gems in 1 minute") //7
	i++
//8
ini_write_string("Challenges",string(i) + ":0","Survive 50 moves") //2 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":1","Survive 75 moves") //3 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":2","Survive 100 moves") //4 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":3","Survive 125 moves") //5 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":4","Survive 150 moves") //6 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":5","Survive 200 moves") //7 M-SURVIVOR
	i++
//9
ini_write_string("Challenges",string(i) + ":0","Fill the progress bar before it drains out (speed x1)") //3
ini_write_string("Challenges",string(i) + ":1","Fill the progress bar before it drains out (speed x2)") //4
ini_write_string("Challenges",string(i) + ":2","Fill the progress bar before it drains out (speed x3)") //7
ini_write_string("Challenges",string(i) + ":3","Fill the progress bar before it drains out in 8 minutes (speed x3)") //8
ini_write_string("Challenges",string(i) + ":4","Fill the progress bar before it drains out in 5 minutes (speed x3)") //9
ini_write_string("Challenges",string(i) + ":5","Fill the progress bar before it drains out in 3 minutes (speed x3)") //10
	i++
//10
ini_write_string("Challenges",string(i) + ":0","Destroy 5 ices") //2
ini_write_string("Challenges",string(i) + ":1","Destroy 8 ices") //3
ini_write_string("Challenges",string(i) + ":2","Destroy 10 ices") //4
ini_write_string("Challenges",string(i) + ":3","Destroy 10 ices in 3 minutes") //5
ini_write_string("Challenges",string(i) + ":4","Destroy 15 ices") //6
ini_write_string("Challenges",string(i) + ":5","Destroy 18 ices") //7
	i++
//11
ini_write_string("Challenges",string(i) + ":0","Destroy 7 coals in one move") //1
ini_write_string("Challenges",string(i) + ":1","Destroy 15 coals in 3 minutes") //3
ini_write_string("Challenges",string(i) + ":2","Destroy 16 coals in one move in 5 minutes") //4
ini_write_string("Challenges",string(i) + ":3","Destroy 24 coals in 3 minutes") //4
ini_write_string("Challenges",string(i) + ":4","Destroy 30 coals in 3 minutes") //5
ini_write_string("Challenges",string(i) + ":5","Destroy 40 coals in 3 minutes") //6
	i++
//12
ini_write_string("Challenges",string(i) + ":0","Destroy 7 bombs") //1
ini_write_string("Challenges",string(i) + ":1","Destroy 10 bombs in 3 minutes") //2
ini_write_string("Challenges",string(i) + ":2","Destroy 12 bombs") //3
ini_write_string("Challenges",string(i) + ":3","Destroy 16 bombs") //4
ini_write_string("Challenges",string(i) + ":4","Destroy 20 bombs in 3 minutes") //5
ini_write_string("Challenges",string(i) + ":5","Destroy 16 bombs that spawn instantly") //8
	i++
//13
ini_write_string("Challenges",string(i) + ":0","Make a supernova") //1
ini_write_string("Challenges",string(i) + ":1","Make 6 supernovas in 5 minutes") //2
ini_write_string("Challenges",string(i) + ":2","Make 12 supernovas in 5 minutes") //3
ini_write_string("Challenges",string(i) + ":3","Make 8 supernovas in 3 minutes") //5
ini_write_string("Challenges",string(i) + ":4","Make 12 supernovas in 3 minutes") //6
ini_write_string("Challenges",string(i) + ":5","Make 5 supernovas in 1 minute") //7
	i++
//14
ini_write_string("Challenges",string(i) + ":0","Simulate the provided pattern") //1
ini_write_string("Challenges",string(i) + ":1","Simulate the provided pattern") //2
ini_write_string("Challenges",string(i) + ":2","Simulate the provided pattern") //2
ini_write_string("Challenges",string(i) + ":3","Simulate the provided pattern") //3
ini_write_string("Challenges",string(i) + ":4","Simulate the provided pattern") //5
ini_write_string("Challenges",string(i) + ":5","Simulate the provided pattern") //6
	i++
//15
ini_write_string("Challenges",string(i) + ":0","Destroy 12 gems in one move") //1
ini_write_string("Challenges",string(i) + ":1","Destroy 15 gems in one move without lightning") //1
ini_write_string("Challenges",string(i) + ":2","Destroy 24 gems in one move without lightning") //2
ini_write_string("Challenges",string(i) + ":3","Destroy 36 gems in one move without lightning") //2
ini_write_string("Challenges",string(i) + ":4","Destroy 50 gems in one move without lightning") //3
ini_write_string("Challenges",string(i) + ":5","Destroy 75 gems in one move ") //5
	i++
//16
ini_write_string("Challenges",string(i) + ":0","Create a 50 chain in 3 minutes") //3
ini_write_string("Challenges",string(i) + ":1","Create a 85 chain in 3 minutes") //3
ini_write_string("Challenges",string(i) + ":2","Create a 100 chain in 3 minutes") //4
ini_write_string("Challenges",string(i) + ":3","Create a 125 chain in 3 minutes") //4
ini_write_string("Challenges",string(i) + ":4","Create a 145 chain in 3 minutes") //5
ini_write_string("Challenges",string(i) + ":5","Create a 300 chain in 5 minutes") //8
	i++
//17
ini_write_string("Challenges",string(i) + ":0","Score 1500 points in one move") //1
ini_write_string("Challenges",string(i) + ":1","Score 15000 points in 1 minute") //3
ini_write_string("Challenges",string(i) + ":2","Score 50000 points in 3 minutes") //3
ini_write_string("Challenges",string(i) + ":3","Score 100000 points in 5 minutes") //3
ini_write_string("Challenges",string(i) + ":4","Score 25000 points in one move") //6
ini_write_string("Challenges",string(i) + ":5","Score 500000 points in 5 minutes") //8
	i++
//18
ini_write_string("Challenges",string(i) + ":0","Destroy 8 dooms") //2 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":1","Destroy 10 dooms") //3
ini_write_string("Challenges",string(i) + ":2","Destroy 16 dooms") //4
ini_write_string("Challenges",string(i) + ":3","Destroy 20 dooms in 5 minutes") //4
ini_write_string("Challenges",string(i) + ":4","Destroy 23 dooms") //5
ini_write_string("Challenges",string(i) + ":5","Destroy 25 dooms") //6
	i++
//19
ini_write_string("Challenges",string(i) + ":0","Protect your companion gem for 30 moves") //1
ini_write_string("Challenges",string(i) + ":1","Protect your companion gem for 50 moves") //3
ini_write_string("Challenges",string(i) + ":2","Protect your companion gem for 65 moves") //5
ini_write_string("Challenges",string(i) + ":3","Protect your companion gem for 85 moves") //5
ini_write_string("Challenges",string(i) + ":4","Protect your companion gem for 125 moves") //6
ini_write_string("Challenges",string(i) + ":5","Protect your companion gem for 150 moves") //7
	i++
//20
ini_write_string("Challenges",string(i) + ":0","Destroy 5 skulls") //2 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":1","Destroy 12 skulls") //5 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":2","Destroy 16 skulls") //6 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":3","Destroy 21 skulls") //8 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":4","Destroy 25 skulls") //9 M-SURVIVOR
ini_write_string("Challenges",string(i) + ":5","Destroy 25 skulls in 3 minutes") //10 M-SURVIVOR
	i++
//21
ini_write_string("Challenges",string(i) + ":0","Make 3 flame gems in one move") //2 M-UNTIMED
ini_write_string("Challenges",string(i) + ":1","Make 2 lightning gems and 2 flame gems in one move") //3 M-UNTIMED
ini_write_string("Challenges",string(i) + ":2","Make 3 lightning gems and 3 flame gems in one move") //6 M-UNTIMED
ini_write_string("Challenges",string(i) + ":3","Make 5 supernovas in one move") //6 M-UNTIMED
ini_write_string("Challenges",string(i) + ":4","Make a septanova") //6 M-UNTIMED
ini_write_string("Challenges",string(i) + ":5","Make an octanova") //6 M-UNTIMED
	i++
//22
ini_write_string("Challenges",string(i) + ":0","Clear all the gems") //2 M-UNTIMED
ini_write_string("Challenges",string(i) + ":1","Clear all the gems") //3 M-UNTIMED
ini_write_string("Challenges",string(i) + ":2","Clear all the gems") //4 M-UNTIMED
ini_write_string("Challenges",string(i) + ":3","Clear all the gems") //5 M-UNTIMED
ini_write_string("Challenges",string(i) + ":4","Clear all the gems in exactly 10 moves") //7 M-UNTIMED
ini_write_string("Challenges",string(i) + ":5","Clear all the gems") //7 M-UNTIMED
	i++
//23
ini_write_string("Challenges",string(i) + ":0","Score 1000 points in a zenify combo") //2 M-UNTIMED
ini_write_string("Challenges",string(i) + ":1","Score 2500 points in a zenify combo") //3 M-UNTIMED
ini_write_string("Challenges",string(i) + ":2","Score 4000 points in a zenify combo") //4 M-UNTIMED
ini_write_string("Challenges",string(i) + ":3","Score 6000 points in a zenify combo") //4 M-UNTIMED
ini_write_string("Challenges",string(i) + ":4","Score 8000 points in a zenify combo") //5 M-UNTIMED
ini_write_string("Challenges",string(i) + ":5","Score 10000 points in a zenify combo") //6 M-UNTIMED
	i++
//24
ini_write_string("Challenges",string(i) + ":0","Survive 150 difficult moves") //10
ini_write_string("Challenges",string(i) + ":1","Make 3 octanovas in 3 minutes") //10
ini_write_string("Challenges",string(i) + ":2","Destroy 100 gems in one move") //10
ini_write_string("Challenges",string(i) + ":3","Protect your companion gem for 150 difficult moves") //10
ini_write_string("Challenges",string(i) + ":4","Destroy 10 ices") //10
ini_write_string("Challenges",string(i) + ":5","Destroy 8 skulls") //10
	i++
//25
ini_write_string("Challenges",string(i) + ":0","Destroy 6 dooms")
ini_write_string("Challenges",string(i) + ":1","Do not destroy any user-made special gems for 65 moves")
ini_write_string("Challenges",string(i) + ":2","Protect all your 8 companion gems for 50 moves")
ini_write_string("Challenges",string(i) + ":3","Obtain a fruit in 95 moves")
ini_write_string("Challenges",string(i) + ":4","Destroy 30 lightning gems in one move") 
ini_write_string("Challenges",string(i) + ":5","Score 1,000,000 points in 10 minutes")
	i++
//26
ini_write_string("Challenges",string(i) + ":0","Create a Custom Quest")
ini_write_string("Challenges",string(i) + ":1","Create a Custom Quest")
ini_write_string("Challenges",string(i) + ":2","Create a Custom Quest")
ini_write_string("Challenges",string(i) + ":3","Create a Custom Quest")
ini_write_string("Challenges",string(i) + ":4","Create a Custom Quest") 
ini_write_string("Challenges",string(i) + ":5","Create a Custom Quest")
	i++



#endregion

#region Challenge information
	challenge_ini_difficulties()
#endregion