f = open("mauritius_beach.rgb","rb")
o = open("mauritius_beach.hex","w")
b = f.read(1)
space = 1
while b :
    o.write(str(b.hex()))
    if space >= 3:
        o.write(" ")
        space = 0

    
    space += 1
    b = f.read(1)