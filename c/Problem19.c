/*
 * You are given the following information, but you may prefer to do some research
 * for yourself.
 * 
 *   • 1 Jan 1900 was a Monday.
 *   • Thirty days has September,
 *     April, June and November.
 *     All the rest have thirty-one,
 *     Saving February alone,
 *     Which has twenty-eight, rain or shine.
 *     And on leap years, twenty-nine.
 *   • A leap year occurs on any year evenly divisible by 4, but not on a century
 *     unless it is divisible by 400.
 * 
 * How many Sundays fell on the first of the month during the twentieth century (1
 * Jan 1901 to 31 Dec 2000)?
 */
#include <stdio.h>
#include <time.h>

int wday(int year, int month, int day) {
    struct tm time = {
        .tm_year = year,
        .tm_mon = month,
        .tm_mday = day,
    };
    mktime(&time);
    return time.tm_wday;
}

int main(int argc, char const* argv[]) {
    int count = 0;
    int y, m;
    for (y = 1901; y <= 2000; y++) {
        for (m = 0; m < 12; m++) {
            if (!wday(y, m, 1)) {
                count++;
            }
        }
    }
    printf("%d\n", count);
    return 0;
}

