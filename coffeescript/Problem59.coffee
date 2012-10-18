###
Each character on a computer is assigned a unique code and the preferred
standard is ASCII (American Standard Code for Information Interchange). For
example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.

A modern encryption method is to take a text file, convert the bytes to ASCII,
then XOR each byte with a given value, taken from a secret key. The advantage
with the XOR function is that using the same encryption key on the cipher text,
restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.

For unbreakable encryption, the key is the same length as the plain text
message, and the key is made up of random bytes. The user would keep the
encrypted message and the encryption key in different locations, and without
both "halves", it is impossible to decrypt the message.

Unfortunately, this method is impractical for most users, so the modified
method is to use a password as a key. If the password is shorter than the
message, which is likely, the key is repeated cyclically throughout the
message. The balance for this method is using a sufficiently long password key
for security, but short enough to be memorable.

Your task has been made easy, as the encryption key consists of three lower
case characters. Using cipher1.txt (right click and 'Save Link/Target As...'),
a file containing the encrypted ASCII codes, and the knowledge that the plain
text must contain common English words, decrypt the message and find the sum of
the ASCII values in the original text.
###

fs = require('fs')
_ = require('underscore')

FILE = './cipher1.txt'
data = fs.readFileSync(FILE, 'ascii').replace(/\r/g, '').split(',').map(Number)

expand = (arr, length) ->
	res = []
	while res.length < length
		for i in arr
			res .push i
	res.length = length
	res

ASCII = (String.fromCharCode(i) for i in [32..122])
LOWERS = (String.fromCharCode(i) for i in [97..122])
keys = _.flatten(((c + b + a for a in LOWERS) for b in LOWERS) for c in LOWERS)

decrypt = (buffer, key) ->
	zipped_arr = _.zip(buffer, expand(key, buffer.length))
	arr = zipped_arr.map((x) -> x[0] ^ x[1].charCodeAt())
	arr.map((x) -> String.fromCharCode(x)).join('')

isText = (string) ->
	[lower, amount] = [0, 0]
	for char in string
		return false unless char in ASCII
		if char in LOWERS
			lower++
		amount++
	lower / amount > 0.7

candidates = []
for key in keys
	res = decrypt(data, key)
	candidates.push(res) if isText(res)
original = candidates.filter((x) -> x.match(/\ the\ /))[0]
ans = (char.charCodeAt() for char in original).reduce((x, y) -> x + y)
console.log(ans)


