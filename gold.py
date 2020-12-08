from PIL import Image



def cluster(r,g,b):
    global cores
    mmin = distance(cores[0][0],r,g,b)
    closest = 0
    for i in range(len(cores)):
        if mmin > distance(cores[i][0],r,g,b):
            mmin = distance(cores[i][0],r,g,b)
            closest = i



    cores[closest][1] += r
    cores[closest][2] += g
    cores[closest][3] += b
    cores[closest][4] += 1
    
    #if [hex(r),hex(g),hex(b)] not in cores[closest][5]:
    cores[closest][5].append([hex(r),hex(g),hex(b)])


    
    

def distance(x,r,g,b):
    return abs(x-r) + abs(x-g) + abs(x-b)


cores = [
    [0,0,0,0,0 , []], 
    [16,0,0,0,0, []],
    [32,0,0,0,0, []],
    [48,0,0,0,0, []],
    [64,0,0,0,0, []],
    [80,0,0,0,0, []],
    [96,0,0,0,0, []],
    [112,0,0,0,0, []],
    [128,0,0,0,0, []],
    [144,0,0,0,0, []],
    [160,0,0,0,0, []],
    [176,0,0,0,0, []],
    [192,0,0,0,0, []],
    [208,0,0,0,0, []],
    [224,0,0,0,0, []],
    [255,0,0,0,0, []]
    ]
f = open("./sample_1.rgb","rb")
arr = bytearray(3)

arr = f.read(3)
while arr :
    cluster(arr[0],arr[1],arr[2])
    arr = f.read(3)








for m,r,g,b,c,v in cores:
    for x in v:
        print("# the closeset to {0} is {1} #".format(''.join([format(int(c, 16), '02x') for c in x]),''.join([format(int(b, 16), '02x') for b in [hex(m),hex(m),hex(m)] ])))
