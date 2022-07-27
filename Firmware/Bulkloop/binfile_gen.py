#!/c/Users/wusha/anaconda3/envs/py35/python
import struct
import sys
import argparse
import string

#parser.add_argument('-n', type=int, default=32, help='datanum -n')
#args = parser.parse_args()

#print(sys.argv[1])
#print(len(sys.argv))

if len(sys.argv)!=2:
    print("commond erro! example: python3 xxx.py decNum")

fp = open('test_bin.bin','wb')

max_data = int(sys.argv[1])

for x in range(0,max_data):
    #a = struct.pack('I',x)  # 32
    #a = struct.pack('B',x)  # 8
    a = struct.pack('H',x)   # 16
    #b = struct.unpack('H',a) 
    #print(b)
    fp.write(a)

fp.close()
print("bin file generated success!!")
