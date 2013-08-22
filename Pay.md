
// When i put somthing in '' (ex:'salary') you need to get that value from the table
//Doctor Pay im not realy sure how to put this but this should work for the demo:
//after 3 years a person in the doctor table is considered a real doctor (paywise)

if('numYears'<=3)
	$salary= 40000+(2000*'numYears');
else
	$pay= 'visits'*50 + 'operations'*200;


//SALARY FOR DIRECTOR
$salary= 'salary' * pow(1.015,'numYears');

//SALARY FOR SAdmin
$salary= 'salary' * pow(1.0115,'numYears');

//SALARY FOR admin
$salary= 'salary' * pow(1.01,'numYears');

// 1st part tells them hourly pay 
// 2nd part says how much they get for working overtime

//SALARY FOR nurse+Snurse
$salary= 'salary' + (1.50 * floor('numYears'/5));
if('equal to Snurse'){
	$salary=$salary+3.25;
}
$overtimepay='overtimeHours'*(1.25*24.25));

//SALARY FOR technicians
$salary= 'salary' + (1.25 * floor('numYears'/8));
$overtimepay='overtimeHours'*(1.5*'salary'));





<h5>Nurse:</h5>

Nurse = {$24.50 + [ **Mod** 5( **years** ) x $1.50]} / hour<br/>
Nurse Shift Sup = **Nurse** + $3.25/hour<br/>
Nurse OT = **If** (Nurse hours >= 36) **Then** Nurse pay + ($24.50 * 1.25)/hour<br/>


<h5>Tech:</h5>
Ped = $16.00<br/>
XRay = $18.50<br/>
Comp = $18.00<br/>
Blood = $17.50<br/>
Ster = $16.00<br/>
 	   
Tech Pay = { **Tech** + [ **Mod** 8( **years** ) x $1.25]} / hour<br/>
Tech OT = **If** (Tech hours >= 37.5) **Then** Tech pay + ($24.50 * 1.50)/hour<br/>

<h5>Admin:</h5>
$78,500/year x ( **year** x 0.01)<br/>

<h5>SAdmin:</h5>
$98,000/year x ( **year** x 0.0115)<br/>

<h5>Direct:</h5>
$125,000/year x ( **year** x 0.015)<br/>

<h5>Doctor:</h5>
1st Year Intern = $40,000/year<br/>
1st Year Resident = $42,000/year<br/>
2nd Year Resident = $44,000/year<br/>
3rd Year Resident = $46,000/year<br/>