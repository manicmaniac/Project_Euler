/*
Starting in the top left corner of a 2×2 grid, there are 6 routes (without
backtracking) to the bottom right corner.

[p_015]

How many routes are there through a 20×20 grid?
*/

for(x=1,i=41;i-->21;)x*=i;for(y=1,j=21;j-->1;)y*=j;console.log(x/y/1-x/y%1)

