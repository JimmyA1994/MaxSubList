val A = [~2,1,~3,4,~1,2,1,~5,4];

fun max (a,b) = if (a>=b) then a else b;

fun loop ( nil , meh, msf) = msf
|   loop ( x::t ,meh, msf) = let
								val meh = max (x,meh+x)
								val msf = max (msf,meh)
							 in
							 	loop (t, meh, msf)
							 end;

fun maxSublist A = loop (tl A, hd A, hd A);

maxSublist A;

(* MSList returns the MaxSublist *)

fun aux (msf,_,nil,sl,_) = (msf,sl)
|	aux	(msf,cm,x::t,sl,csl) = 	if (cm+x>x) then 
									if (cm+x>msf) then aux (cm+x,cm+x,t,csl@[x],csl@[x])
									else aux (msf,cm+x,t,sl,csl@[x])
								else	
									if (x>msf) then aux (x,x,t,[x],[x])
									else aux (msf,x,t,sl,[x])

fun MSList nil = (0,nil)
|	MSList (h::t) = aux (h,h,t,[h],[h]);									
