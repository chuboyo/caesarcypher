try:
    import pyperclip
except ImportError:
    pass

SYMBOLS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

print('This is a Caesar cypher. Use a certain key to encrypt/Decrypt a message. Look out for further instructions')

#Select mode 
while True:
    print('Enter "e" or "d" to encrypt or decrypt a message respectively.')
    response = input('').lower()
    if response == 'e':
        mode  = 'encrypt'
        break
    elif response == 'd':
        mode = 'decrypt'
        break
    print('Please enter "e" or "d".')

#Define limits for the key and allow users to enter their key
while True:
    max_length = len(SYMBOLS) - 1
    print(f'Enter a key from 0 to {max_length}')
    response = input('')
    if int(response) > 0 and int(response) < len(SYMBOLS):
        key = int(response)
        break

#Enter the message to encrypt or decrypt 
print(f'Enter message to {mode}')
message = input('').upper()

translated = ''

for symbol in message:
    if symbol in SYMBOLS:
        num = SYMBOLS.find(symbol)
        if mode == 'encrypt':
            num = num + key
        elif mode == 'decrypt':
            num = num - key

        if num >= len(SYMBOLS):
            num = num - len(SYMBOLS)
        elif num < 0:
            num = num + len(SYMBOLS)

        translated = translated + SYMBOLS[num]
    else:
        translated = translated + symbol

print(translated)

#Copy encrypted/decrypted text to clip board
try:
    pyperclip.copy(translated)
    print('Full {}ed text copied to clipboard.'.format(mode))
except:
    pass



