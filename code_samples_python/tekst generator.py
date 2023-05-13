# Generowanie tekstu - stwórz model, który będzie potrafił generować tekst w stylu  znanych autorów
import random
import string

# lista dostępnych stylów tekstu
styles = {
    'normal': string.ascii_letters + string.digits,
    'uppercase': string.ascii_uppercase + string.digits,
    'lowercase': string.ascii_lowercase + string.digits,
    'symbols': string.ascii_letters + string.digits + string.punctuation
}


def generate_text(length, num_words, style='normal'):
    if style in styles:
        char_set = styles[style]
    else:
        char_set = styles['normal']

    text = ''.join(random.choices(char_set, k=length))

    words = text.split()

    words = words[:num_words]

    return ' '.join(words)


print(generate_text(100, 10, 'uppercase'))
