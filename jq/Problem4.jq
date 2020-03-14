# A palindromic number reads the same both ways. The largest palindrome made from
# the product of two 2-digit numbers is 9009 = 91 × 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

def reverse_digits:
  tostring | split("") | reverse | join("") | tonumber;

def palindrome:
  . * (log10 | floor | pow(10; . + 1)) + reverse_digits;

def is_product_of_3_digits:
  . as $x | any(range(100; 1000); $x % . == 0 and $x / . < 1e3);

first(range(999; 99; -1) | palindrome | select(is_product_of_3_digits))
