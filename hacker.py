#Hack the cipher with brute force
print('This is a caesar cipher hacker')

SYMBOLS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
print('Enter message to decrypt')
message = input('').upper()



for key in range(len(SYMBOLS)):
    translated = ''
    
    for symbol in message:
        if symbol in SYMBOLS:
            num = SYMBOLS.find(symbol)
            num = num - key

            if num < 0:
                num = num + len(SYMBOLS)

            translated = translated + SYMBOLS[num]
        else:
            translated = translated + symbol

    print(f'key #{key} : {translated}')