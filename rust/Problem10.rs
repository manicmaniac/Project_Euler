/*
 * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 *
 * Find the sum of all the primes below two million.
 */

fn sieve(is_composites: &mut [bool]) {
    is_composites[0] = true;
    is_composites[1] = true;
    let sqrt_limit = (is_composites.len() as f64).sqrt() as usize;
    for i in 2..sqrt_limit {
        if !is_composites[i] {
            for j in i..(((is_composites.len() as f64) / i as f64).ceil() as usize) {
                is_composites[j * i] = true;
            }
        }
    }
}

fn main() {
    let mut is_composites = [false; 2000000];
    sieve(&mut is_composites);
    let answer: usize = is_composites.iter()
        .enumerate()
        .filter_map(|(i, &is_composite)| if is_composite { None } else { Some(i) })
        .sum();
    println!("{}", answer);
}
