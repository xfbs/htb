#!/usr/bin/python2.7
import random
chars = []
keys = [0x70, 0x61, 0x73, 0x73, 0x77, 0x6f, 0x72, 0x64, 0x21, 0x21]
lock_pick = random.randint(0, 0x3e8)
lock = lock_pick * 2
lock = lock + 10
lock = lock / 2
lock = lock - lock_pick
for key in keys:
    keys_encrypt = lock ^ key
    chars.append(keys_encrypt)
print("".join([chr(a) for a in chars]))
