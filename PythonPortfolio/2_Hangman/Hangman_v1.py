from random import choice

lista_palabras = ['abogado', 'azul', 'bicicleta', 'callejon', 'destino',
                  'espectaculo', 'furgoneta', 'gigante', 'hipopotamo', 'incendio',
                  'jardin', 'kilometro', 'luminoso', 'medusa', 'naufrago',
                  'oceano', 'piscina', 'quimica', 'refugio', 'sandwich']

nombre_jugador = input('¿Cuál es tu nombre? ')

palabra_aleatoria = choice(lista_palabras)

largo_palabra = '_' * len(palabra_aleatoria)

letras_incorrectas = []

vidas_jugador = 6

print(f'Muy bien {nombre_jugador}, tu palabra tiene '
      f'{len(palabra_aleatoria)} letras.')

print(largo_palabra)


def pedir_letra_valida():
    while True:
        letra = input('Ingresa una letra: ')
        if letra.isalpha() and len(letra) == 1:
            return letra
        else:
            print('Carácter incorrecto. Intenta nuevamente.')


def letra_en_palabra():
    global largo_palabra
    global letras_incorrectas
    global vidas_jugador
    while vidas_jugador > 0:
        letra = pedir_letra_valida()
        if letra in palabra_aleatoria:
            print(f'La letra "{letra}" sí se encuentra')
            nueva_palabra = list(largo_palabra)

            for i in range(len(palabra_aleatoria)):
                if palabra_aleatoria[i] == letra:
                    nueva_palabra[i] = letra

            largo_palabra = "".join(nueva_palabra)
            print(letras_incorrectas)
            print(largo_palabra)
        else:
            letras_incorrectas.append(letra)
            nuevas_letras_incorrectas = set(letras_incorrectas)
            letras_incorrectas = list(nuevas_letras_incorrectas)

            print(f'La letra "{letra}" no se encuentra')
            print(letras_incorrectas)
            print(largo_palabra)
            vidas_jugador -= 1
            print(f'Vidas restantes = {vidas_jugador}')

        if largo_palabra == palabra_aleatoria:
            print(f'¡Felicidades {nombre_jugador} acertaste la palabra!\n'
                  f'Te sobraron {vidas_jugador} vidas')
            break
        else:
            pass
    else:
        print(f'Lo siento {nombre_jugador}, agotaste tus 6 oportunidades\n'
              f'La palabra correcta era "{palabra_aleatoria}"')


letra_en_palabra()
