Nurse = {$24.50 + [Mod5(years) x $1.50]} / hour
Nurse Shift Sup = Nurse + $3.25/hour
Nurse OT = If (Nurse hours >= 36) Then Nurse pay + ($24.50 * 1.25)/hour


TechType = Ped = $16.00
	    = XRay = $18.50
	    = Comp = $18.00
	    = Blood = $17.50
 	   = Ster = $16.00
Tech = {TechType + [Mod8(years) x $1.25]} / hour
Tech OT = If (Tech hours >= 37.5) Then Tech pay + ($24.50 * 1.50)/hour

Admin = $78,500/year * (year*0.01)
SAdmin = $98,000/year *(year*0.0115)

Direct = $125,000/year * (year*0.015)

Doc = 1st Year Intern = $40,000/year

        = 1st Year Resident = $42,000/year
        = 2nd Year Resident = $44,000/year
        = 3rd Year Resident = $46,000/year