/*
 * The following iterative sequence is defined for the set of positive integers:
 *
 * n → n/2 (n is even)
 * n → 3n + 1 (n is odd)
 *
 * Using the rule above and starting with 13, we generate the following sequence:
 *
 * 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 *
 * It can be seen that this sequence (starting at 13 and finishing at 1) contains
 * 10 terms. Although it has not been proved yet (Collatz Problem), it is thought
 * that all starting numbers finish at 1.
 *
 * Which starting number, under one million, produces the longest chain?
 *
 * NOTE: Once the chain starts the terms are allowed to go above one million.
 */

fn find_longest_collatz_chain(limit: u64) -> u64 {
    let limit = limit as usize;
    let mut cache = vec![0; limit + 1];
    let mut longest_start = 0;
    let mut longest_length = 0;
    let mut length;
    for start in 1..limit {
        length = 1;
        let mut i = start;
        while i > 1 {
            if i % 2 == 0 {
                i /= 2;
            } else {
                i = 3 * i + 1;
            }
            if i <= limit && cache[i] > 0 {
                length += cache[i];
                break;
            }
            length += 1;
        }
        if longest_length < length {
            longest_start = start;
            longest_length = length;
        }
        cache[start] = length;
    }
    longest_start as u64
}

fn main() {
    println!("{}", find_longest_collatz_chain(1000000));
}
