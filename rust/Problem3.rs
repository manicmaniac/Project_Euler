/*
 * The prime factors of 13195 are 5, 7, 13 and 29.
 *
 * What is the largest prime factor of the number 600851475143 ?
 */
use std::collections::HashMap;

fn factorize(x: i64) -> HashMap<i64, i64> {
    let mut map: HashMap<i64, i64> = HashMap::new();
    let mut x = x;
    let mut divisor = 2;
    while x >= divisor {
        let rem = x % divisor;
        if rem > 0 {
            divisor += 1;
        } else {
            let counter = map.entry(divisor).or_insert_with(|| 0);
            *counter += 1;
            x /= divisor;
        }
    }
    map
}

fn main() {
    let map = factorize(600851475143);
    println!("{}", map.keys().max().unwrap());
}
