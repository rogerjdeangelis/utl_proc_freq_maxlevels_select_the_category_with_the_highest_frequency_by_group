Problem can be solved with just proc freq

see
https://tinyurl.com/y6we4mmf
https://communities.sas.com/t5/SAS-Procedures/How-can-I-create-a-new-variable-that-has-the-highest-freq-across/m-p/469331

INPUT
=====

Up to 40 obs WORK.HAVE total obs=15

Obs     ID    VAR

  1    100     2
  2    100     2
  3    100     2
  4    100     4
  5    100     5  three 2s so 100 x 2 has the highest frequency
                  output  100 2  frequency=3
  6    101     3
  7    101     3
  8    101     1
  9    101     2
 10    101     3  three 3s so 101 3 frequency=3

 11    102     4
 12    102     4
 13    102     5
 14    102     2
 15    102     1  two 4s so 101 3 frequency=2


EXAMPLE OUTPUT

  WORK.WANT total obs=3

     ID    VAR   FREQUENCY

    100     2       3
    101     3       3
    102     4       2


PROCESS
=======

  ods exclude all;
  ods output onewayfreqs=want(keep=id var frequency);
  proc freq data=have order=freq ;
   by id;
   tables var / maxlevels=1 list ;
  run;quit;
  ods select all;


OUTPUT
======

  WORK.WANT total obs=3

     ID    VAR   FREQUENCY

    100     2       3
    101     3       3
    102     4       2

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

data test;
   input x frq;
   datalines;
1 10
2 30
3 12
4 5
5 24
6 77
;
run;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

see process;


