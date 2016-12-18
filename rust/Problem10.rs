/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */

fn sieve(limit: usize) -> Vec<i64> {
  let mut is_primes: Vec<bool> = Vec::with_capacity(limit);
  for _ in 0..limit {
    is_primes.push(true);
  }
  is_primes[0] = false;
  is_primes[1] = false;
  let sqrt_limit = (limit as f64).sqrt() as usize;
  for i in 2..sqrt_limit {
    if is_primes[i] == true {
      for j in i..(((limit as f64) / i as f64).ceil() as usize) {
        is_primes[j * i] = false
      }
    }
  }
  let mut result: Vec<i64> = Vec::new();
  for (i, &is_prime) in is_primes.iter().enumerate() {
    if is_prime {
      result.push(i as i64);
    }
  }
  return result;
}

fn main() {
  let primes = sieve(2000000);
  println!("{}", primes.iter().fold(0, |x, y| x + y));
}
