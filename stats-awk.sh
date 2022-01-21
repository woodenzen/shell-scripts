#!/usr/bin/awk -f
BEGIN{size=10} {
      mod=NR%size
      daytotal=$2 + $3 + $4
      perc_2=100*($2/daytotal)
      perc_3=100*($3/daytotal)
      perc_4=100*($4/daytotal)
  if (max<daytotal) {max=daytotal; maxday=$1}
  if(NR<=size){ count++}
  else        {sum-=array[mod]}
     sum+=daytotal
     array[mod]=daytotal
     printf "%8.8s %5.5s %5.5s %5.5s %5.2f %5.2f %5.2f %5.5s %5.0f\n", $1, $2, $3, $4, perc_2, perc_3, perc_4, daytotal, sum/count}
END{print "# top traffic on", maxday, " : ", max, " visits"}

# https://www.techrepublic.com/blog/linux-and-open-source/how-and-why-to-do-math-with-awk/

# Lines 2 and 14 are, or should be, self explanatory. By default, awk works on a text stream, one line at a time: all the commands in an awk script are applied as they are to every line. However, if you want to do something before or after processing all those lines, you can do it. Put in braces right after the BEGIN keyword what needs to happen before starting, and mark with END what must be done when there is no more input. In my script, I initialize the size of the rolling average window to 7, and tell the script to print some summary data right before exiting.

# The central part of the script shows that you can tell awk to perform calculations in a relatively intuitive way, once you know a few basic keywords. In awk, the special NR variable holds the number of records already processed (by default, each line of the text input stream is one record). The variables named $N ($1, $2 and so on) always contain the value of field N of the current record. Therefore, lines 4 to 7 are all I need to calculate the total number of visit in each day and how much each page contributes to that traffic. I also tell awk to save the highest number of visits and the day when they happened in the max and maxday variables (line 8), so it can print them later (line 14).

# As it happens in other languages, '%' is the modulo operator. It is used in line 3 to create an index, mod, that continuously cycles between the values 0 and "size - 1", that is 6.

# By definition, in order to calculate a rolling average over one week, we need to sum all the visits received in any given day and the 6 previous ones, and then divide that number by 7. The script accomplishes this with three variables: count is the division factor, that is equal to the maximum between size and NR. sum is, as its name says, the sum of all the visits in the last week. array, instead, is an array made of 7 elements, each one containing the total visits for one of the last 7 days.

# Every time awk loads a line from the input file, it subtracts from sum the visits that happened one week before (line 10), then adds to it those of the current day (line 11). The next line replaces in the array the visits received seven days earlier with the current daytotal. Finally, line 13 prints everything in ordered columns, ready to be plotted or processed in other ways,
