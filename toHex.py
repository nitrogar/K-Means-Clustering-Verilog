f = open("sample_1.rgb","rb")
o = open("sample_1.hex","w")
b = f.read(1)
space = 1
while b :
    o.write(str(b.hex()))
    if space >= 3:
        o.write(" ")
        space = 0

    
    space += 1
    b = f.read(1)