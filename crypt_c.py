kdef = lambda x,y,m:x*y%m
def gett(n:int,g:int,m:int):
    for x in range(m):
        if kdef(x,n,m) == g:return x

def invers(n:int,m:int):
    a = n
    b = 0
    for f in range(m):
        b = kdef(a,n,m)
        if b == 1:
            print(f"length:{f}")
            return a
        a = b

def scale(n:int,m:int,s1:int,s2:int):
    # n should stay as is!
    return ((n * s1) % (m * s2),m * s2)