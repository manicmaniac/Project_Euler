/*
 * Using names.txt (right click and 'Save Link/Target As...'), a 46K text file
 * containing over five-thousand first names, begin by sorting it into
 * alphabetical order. Then working out the alphabetical value for each name,
 * multiply this value by its alphabetical position in the list to obtain a name
 * score.
 *
 * For example, when the list is sorted into alphabetical order, COLIN, which is
 * worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would
 * obtain a score of 938 × 53 = 49714.
 *
 * What is the total of all the name scores in the file?
 */
use std::fs::File;
use std::result::Result;
use std::io::prelude::*;

fn calc_name_score(name: &str) -> i32 {
    let bytes = name.as_bytes();
    bytes.iter().map(|x| x - 64).fold(0, |x, y| x + y as i32)
}

fn get_contents_of_file(filename: &str) -> Result<String, std::io::Error> {
    let mut f = try!(File::open(filename));
    let mut s = String::new();
    try!(f.read_to_string(&mut s));
    Ok(s)
}

fn main() {
    let s = get_contents_of_file("../resources/names.txt").unwrap();
    let comma_separated_names = s.replace("\"", "");
    let mut names: Vec<&str> = comma_separated_names.split(",").collect();
    names.sort();
    let answer = names.iter()
                      .enumerate()
                      .map(|(i, &name)| (i as i32 + 1) * calc_name_score(name))
                      .fold(0, |x, y| x + y);
    println!("{}", answer);
}
