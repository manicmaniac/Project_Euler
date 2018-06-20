/* By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
 * the 6th prime is 13.
 *
 * What is the 10 001st prime number?
 */

fn guess_primes_count(to: i64) -> f64 {
    let x = to as f64;
    x / x.ln()
}

fn sieve(limit: usize) -> Vec<i64> {
    let mut is_primes: Vec<bool> = Vec::with_capacity(limit);
    for _ in 0..limit {
        is_primes.push(true);
    }
    is_primes[0] = false;
    is_primes[1] = false;
    let sqrt_limit = (limit as f64).sqrt() as usize;
    for i in 2..sqrt_limit {
        if is_primes[i] {
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
    result
}


fn main() {
    for i in 2.. {
        if guess_primes_count(i) > 10001.0 {
            let sieved = sieve(i as usize);
            println!("{}", sieved[10000]);
            break;
        }
    }
}
