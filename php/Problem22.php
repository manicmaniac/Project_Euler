<?php
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

function letter_score($letter) {
    return ord($letter) - 64;
}

function name_score($name) {
    return array_sum(array_map('letter_score', str_split($name)));
}

$file = new SplFileObject('../resources/names.txt');
$file->setFlags(SplFileObject::READ_CSV);

$row = $file->current();
sort($row);

$acc = 0;
foreach ($row as $key => $value) {
    $acc += ($key + 1) * name_score($value);
}
echo $acc;

?>

