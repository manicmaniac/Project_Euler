'''
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
'''
from itertools import permutations
from string import printable

CIPHER = r"./cipher1.txt"

class Decryptor(object):
    def __init__(self, cipher):
        self.cipher = cipher

    def decrypt_with(self, key):
        def key_cycle(key):
            res = []
            while len(res) <= len(self.cipher):
                for i in key:
                    res.append(ord(i))
            return res

        res = ''.join(map(chr, [i[0]^i[1] for i in zip(self.cipher, key_cycle(key))]))
        if all(i in printable for i in res):
            return res


def generate_keys(digits):
    return [map(chr, i) for i in permutations(range(97, 123), digits)]


if __name__ == '__main__':
    with open(CIPHER) as f:
        cipher = map(int, f.read().rstrip().split(','))
    decryptor = Decryptor(cipher)
    for i in generate_keys(3):
        res = decryptor.decrypt_with(i)
        if res and all(i in res for i in [' is ', ' the ']):
            message = res

    print sum(ord(i) for i in message)
