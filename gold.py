from math import sqrt

iter = 0
cores = [
    [[0,0,0],0,0,0,0 , []], 
    [[16,16,16],0,0,0,0, []],
    [[32,32,32],0,0,0,0, []],
    [[48,48,48],0,0,0,0, []],
    [[64,64,64],0,0,0,0, []],
    [[80,80,80],0,0,0,0, []],
    [[96,96,96],0,0,0,0, []],
    [[0,0,0],0,0,0,0, []],
    [[128,128,128],0,0,0,0, []],
    [[144,144,144],0,0,0,0, []],
    [[160,160,160],0,0,0,0, []],
    [[176,176,176],0,0,0,0, []],
    [[192,192,192],0,0,0,0, []],
    [[208,208,208],0,0,0,0, []],
    [[224,224,224],0,0,0,0, []],
    [[255,255,255],0,0,0,0, []]
    ]
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
    #cores[closest][5].append([hex(r),hex(g),hex(b)])


    
    

def distance(x,r,g,b):
    #print("x", x)
    #return sqrt((x[2]-r)**2 + (x[1]-g)**2 + (x[0]-b)**2)
    return abs(x[2]-r) + abs(x[1]-g) + abs(x[0]-b)

def divide():

    global cores
    global iter
    res =[]
    for m,r,g,b,c,v in cores:
        if c == 0:
            res.append([0,0,0])
            #print("#{5} [BY ZEROR] the division of core {0} by {1} is red {2}  green {3} blue {4} #".format(m,c,0,0,0,iter))

        else:
            #print("#{5} the division of core {0} by {1} is red {2}  green {3} blue {4} #".format(m,c,int(r/c),int(g/c),int(b/c),iter))
            res.append([int(r/c),int(g/c),int(b/c)])

    return res
def stable(nm):
    global cores
    stable = True
    for i in range(len(cores)):
        m,r,g,b,c,v = cores[i]
        x = nm[i]
        if m[1] != x[1] or m[0] != x[0] or m[2] != x[2]  :
            #print(m,x)
            cores[i][0] = x
            #print("Update cores by x ",x)
            stable = False

            
        
    return stable



while True:
    #f = open("sample_1.rgb","rb")
    #arr = bytearray(3)

    #arr = f.read(3)
    #while arr :
    f = open("sample_1.hex")
    for line in f.readlines():
        for w in line.split():
            #print(w[0:2],w[2:4],w[4:6])#,l[1:3],l[0:1])
            cluster(int(w[0:2],16),int(w[2:4],16),int(w[4:6],16))
        #arr = f.read(3)
        
    nm = divide()
    if stable(nm) :
        break
    iter += 1
    for i in range(len(cores)):
        cores[i] = [cores[i][0],0,0,0,0,[]]
    #print("############")
    print ([row[0] for row in cores])
    h = []
    for m in [row[0] for row in cores]:
        h.append([hex(m[0]),hex(m[1]),hex(m[2])])

    print(h)
    print("###################################")

    f.close()






for m,r,g,b,c,v in cores:
    for x in v:
        #print("# the closeset to {0} is {1} #".format(''.join([format(int(c, 16), '02x') for c in x]),''.join([format(int(b, 16), '02x') for b in [hex(m),hex(m),hex(m)] ])))
        print("#{0} means are {1}".format(iter,''.join([format(int(b, 16), '02x') for b in m])))

        pass




