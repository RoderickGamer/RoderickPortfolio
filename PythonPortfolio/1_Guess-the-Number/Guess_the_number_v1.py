from random import *

nombre = input('¿Cuál es tu nombre? ')

print(f'Vamos a comenzar {nombre},\n'
      f'Tienes que adivinar un numero entre el 1 y el 100\n'
      f'Solo tienes 8 intentos para lograrlo')

numero = randint(1, 101)
intentos = 0

while intentos < 8:
      num_usuario = int(input('Elige un número: '))
      if num_usuario < 1 or num_usuario > 100:
            print(f'El número {num_usuario} no está permitido')
      elif num_usuario < numero:
            print('Incorrecto. Elegiste un número menor.')
      elif num_usuario > numero:
            print('Incorercto. Elegiste un número mayor.')
      elif num_usuario == numero:
            print(f'Felicidades {numero} es el número secreto\n'
                  f'Lo conseguiste en {intentos + 1} intentos UwU')
            break

      intentos += 1

      if intentos == 8:
            print('Has agotado todos los intentos.')
