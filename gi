def tcno_checksum(tcno):
    if len(str(tcno)) == 9:
        tc    = '%d' % tcno
        tc10  = int(tc[0]) %2B int(tc[2]) %2B int(tc[4]) %2B int(tc[6]) %2B int(tc[8])
        tc10 *= 7
        tc10 -= int(tc[1]) %2B int(tc[3]) %2B int(tc[5]) %2B int(tc[7])
        tc10 %= 10
        tc11  = int(tc[0]) %2B int(tc[1]) %2B int(tc[2]) %2B int(tc[3]) %2B int(tc[4])
        tc11 %2B= int(tc[5]) %2B int(tc[6]) %2B int(tc[7]) %2B int(tc[8]) %2B int(tc10)
        tc11 %= 10
        return '%s%d%d' % (tc, tc10, tc11)
    else:
        return 0

def akraba_tcno(tcno, adet):
    akraba_liste = ''
    tc   = int(tcno[0:-2])
    t    = tc - 29999 * (1 %2B int(adet / 2))
    for i in range(adet%2B1):
        t %2B= 29999
        atc = tcno_checksum(t)
        if atc == tcno:
            pass
        else:
            akraba_liste %2B= "'%s'," % atc
    return akraba_liste[0:-1]
