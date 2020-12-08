fs = open("xx.txt","r")
fp = open("yy","r")


db = []
for l in fp:
    c = l.split()
    db.append(c)
key = [i[0] for i in db]
for l in fs :
    v,m = l.split()
    try:
        i = key.index(v)
        if m != db[i][1]:
            print("in python is {0} in sim is {1} for pixel {2}".format(db[i][1],m,v))
    except:
        print("{0} is uniqe".format(v))



