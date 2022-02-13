#!/usr/bin/env python3
import json
import sys
import binascii
import secrets

data = json.load(sys.stdin)

j = 0
for i in data['problem 1']:
	i = i.upper()
	data['problem 1'][j] = i
	j = j + 1

j = 0
for i in data['problem 2']:
	temp = bytearray.fromhex(i)
	d_temp = temp.decode()	
	data['problem 2'][j] = d_temp
	j = j + 1

for i in data['problem 3']:
	b = bytearray.fromhex(i)
	k = 0 
	l = 0
	for j in b:
		temp = b[k]
		temp = temp + 32 + k
		b[k] = temp
		k = k + 1
	res = binascii.hexlify(bytearray(b)).decode('utf-8')	
	data['problem 3'][l] = res
	l = l + 1

j=0
for i in data['problem 4']:
	num = i
	rnum = secrets.randbelow(num)
	data['problem 4'][j] = rnum
	j = j+1

json.dump(data, sys.stdout)
