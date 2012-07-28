/*
You are given the following information, but you may prefer to do some research
for yourself.

  • 1 Jan 1900 was a Monday.
  • Thirty days has September,
    April, June and November.
    All the rest have thirty-one,
    Saving February alone,
    Which has twenty-eight, rain or shine.
    And on leap years, twenty-nine.
  • A leap year occurs on any year evenly divisible by 4, but not on a century
    unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century (1
Jan 1901 to 31 Dec 2000)?
*/
import java.util.Calendar

object Problem19 {
  def main(args:Array[String]) {
    val calendar = Calendar.getInstance()
    calendar.clear
    calendar.set(1901, 1, 1)
    val sundays = for(i <- 1 to 1200) yield {
      calendar.add(Calendar.MONTH, 1)
      calendar.get(Calendar.DAY_OF_WEEK) == 1
    }
    println(sundays.count(_==true))
  }
}
