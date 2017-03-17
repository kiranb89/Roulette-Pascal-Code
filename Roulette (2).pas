{ Kiran Bhuvanagiri
GRS Homework -- 3
Program: Roulette
}



program routlette;
 
Var
  firstvalue,secondvalue,thirdvalue,counter1,counter2,counter3,evens,odds,Number,time,menu,Rep,ret:integer;
  Iteration,loop,twoconsecutive,threeconsecutive:qword;
 
  function Roulette():integer; //Function checks for the number of two and three consecutive numbers and also displays the result. 
 // Takes input from user and also calculates the longest evens and odds in a row.
  
  
  var submenu:integer;

  begin
	writeln();
	writeln('Please enter the Number(Positive integer only) of iterations to be performed.');
	writeln('Example: 10000, 100000, 10000000, 100000000 and etc.');
	readln(Iteration);
	writeln;
	writeln('Please choose a Number between 0 and 36 '); //The number should be between 0 and 36 for Roulette.
	writeln;
	readln(Number);
	randomize();
	firstvalue:=0;
	secondvalue:=0;
	thirdvalue:=0;
	loop:=1;
	twoconsecutive:=0;
	threeconsecutive:=0;
	counter1:=0;
	counter2:=0;
	counter3:=0;
	evens:=0;
	odds:=0;
 
	while loop<=Iteration do 
	begin
	  firstvalue:=random(37);    //the random function generates a number between 0 and 36 for Roulette spin
	  if loop>1 then begin
		if (firstvalue=secondvalue) then  begin   //if condition which checks if two consecutive spins of roulette generates the same number
		  twoconsecutive:=twoconsecutive+1;
		  end;

	  end;
	  
	  if ( (firstvalue=secondvalue) and (secondvalue=thirdvalue) and (loop>2) ) then begin   //if condition used to check whether the three consecutive spins of roulette fecthes the same number
		  threeconsecutive:=threeconsecutive+1;
	  end;
	 
	  if ( (firstvalue=Number) and (secondvalue=Number) and (loop>1)  ) then begin //if condition to check whether the user input number macthes the Roulette Spin
		  counter1:=counter1+1;
		  if (counter1=1) then
		   time:=loop;
		 end;
	 
		 if ( (firstvalue mod 2=0) and (firstvalue<>0)  ) then begin    //Calculates the longest run of evens
		 counter2:=counter2+1;
		 counter3:=0;
		 if counter2>evens then
		 evens:=counter2;
		 end;
  
		if ( (firstvalue mod 2=1) and (firstvalue<>0)  ) then begin    //Calculates the longest run of odds
		counter3:=counter3+1;
		counter2:=0;
		if counter3>odds then
        odds:=counter3;
        end;
 
		thirdvalue:=secondvalue;
		secondvalue:=firstvalue;
	 
		loop:=loop+1;
	end;
	writeln;
	writeln('Two Consecutive Numbers Matched in a row  on average is ',twoconsecutive*100/Iteration:4:4,' out of ',Iteration,' number of Roulette Spins');
	writeln;
	writeln('Three Consecutive Numbers Matched in a row  on average is ',threeconsecutive*100/Iteration:4:4,' out of ',Iteration,' number of Roulette Spins');
	writeln;
 
	if ((Number<0) or (Number >36)) then
		writeln('The number entered is out of range(0-36)')
	 
	else if  (time=0) then
		writeln('The Picked number' ,Number,  '  did not come up twice in a row in  ',Iteration,'  number of Routlette Spins')
	 
	else
		writeln('The picked Number ',  Number  , ' matched after ',  time , '  Spins of the roulette');
		writeln;
		writeln('The longest run of evens in a row is',evens);
		 writeln;
		writeln('The longest run of odds in a row is',odds);
		writeln;
		
				repeat
				   writeln;
				   writeln('-----------------------------------------');
				   writeln('Please enter 1  to run the program again') ;
				   writeln;
				   writeln('Please enter 2 to exit ');
				   writeln('-----------------------------------------');
				   writeln;
				   readln(menu);
				if (menu=1) then begin
					Rep:= Roulette();
				end;
				if (menu=2) then begin
					break; 
				end;
				until Rep=2; 
end;
   
begin
	Rep:= Roulette();
	end.
  
end.