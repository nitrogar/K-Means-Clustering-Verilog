from PIL import Image



def cluster(r,g,b):
    global cores
    mmin = distance(cores[0][0],r,g,b)
    closest = 0
    for i in range(len(cores)):
        if mmin > distance(cores[i][0],r,g,b):
            mmin = cores[i][0] 
            closest = i


    cores[closest][1] += r
    cores[closest][2] += g
    cores[closest][3] += b
    cores[closest][4] += 1


    
    

def distance(x,r,g,b):
    return abs(x-r) + abs(x-g) + abs(x-b)


cores = [
    [0,0,0,0,0], 
    [16,0,0,0,0],
    [32,0,0,0,0],
    [48,0,0,0,0],
    [64,0,0,0,0],
    [80,0,0,0,0],
    [96,0,0,0,0],
    [112,0,0,0,0],
    [128,0,0,0,0],
    [144,0,0,0,0],
    [160,0,0,0,0],
    [176,0,0,0,0],
    [192,0,0,0,0],
    [208,0,0,0,0],
    [224,0,0,0,0],
    [255,0,0,0,0]
    ]
im = Image.open("C:\\Users\\atom\\Documents\\COE405\\Project\\sample_1.png")
im = im.convert("RGB")
x,y = im.size
print(x,y)
print(im.getpixel((0,0)))
print(im.getpixel((1,0)))
print(im.getpixel((2,0)))

#print((lambda x: "{0} {1} {2}".format(hex(x[0]),hex(x[1]),hex(x[2]))) (im.getpixel((,0))))

for yi in range(y):
    for xi in range(x):
        #print((xi,yi))
        r,g,b = im.getpixel((xi,yi))
        cluster(r,g,b)



for m,r,g,b,c in cores:
    print("Core {0}    Red:{1}    Green:{2}    Blue:{3}    Count:{4}".format(m,r,g,b,c))
