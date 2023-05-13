import random
import string

def generator(haslo):
    baza = string.ascii_letters + string.punctuation + string.digits
    haslo = ''.join(random.choice(baza) for i in range(dl))
    return haslo
dl= int(input('podaj dlugosc hasla'))
random = generator(dl)
print("haslo :"+random)