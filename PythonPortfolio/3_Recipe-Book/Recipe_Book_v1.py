from pathlib import Path
from os import system
import os

# Cambiar directorio de os
# Asignar directorio de pathlib
os.chdir('C:/Users/rsa_5/Recetas')
recetas = Path(Path.home(), 'Recetas')

# Contar el número de recetas dentro de la carpeta
conteo_recetas = 0
for n in recetas.glob('**/*.txt'):
    conteo_recetas += 1

# Contar el numero de categorias
conteo_categorias = 0
for cat in recetas.iterdir():

    if cat.is_dir():
        conteo_categorias += 1


# Mensaje de bienvenida con ruta, num recetas y num de categorías
def bienvenida():
    print('')
    print('| * * * * * ° * * * * * |'.center(50))
    print('¡Hola wuenas!'.center(50))
    print(f'Las recetas se encuentran en {os.getcwd()}'.center(50))
    print(f'Hay {conteo_recetas} recetas disponibles'.center(50))
    print(f'en {conteo_categorias} categorías diferentes'.center(50))
    print('| * * * * * ° * * * * * |'.center(50))


# Mostrar el menu de opciones
def menu_opciones():
    print('\n')
    print('Opciones:\n'.rjust(31))
    print('[1] - Leer receta\n'.rjust(33))
    print('[2] - Crear Receta\n'.rjust(34))
    print('[3] - Crear categoría\n'.rjust(37))
    print('[4] - Eliminar receta\n'.rjust(37))
    print('[5] - Eliminar categoría\n'.rjust(40))
    print('[6] - Finalizar programa\n'.rjust(40))


# Verificar que la entrada sea un numero entre el 1 y el 6 PARA EL MENU PRINCIPAL y devuelve el numero
def numero_menu_valido():
    bienvenida()
    menu_opciones()

    while True:
        numero = input('Elige una opción: '.rjust(36))
        if numero.isdigit() and int(numero) in range(1, 7):
            system('cls')
            numero_menu = int(numero)
            return int(numero_menu)

        system('cls')
        bienvenida()
        menu_opciones()
        print('Opción inválida.'.rjust(34))


# Unir la bienvenida con los menús
def bienvenida_categorias():
    while True:
        numero_menu = numero_menu_valido()

        if numero_menu == 1:
            leer_receta()
        elif numero_menu == 2:
            crear_nombre()
        elif numero_menu == 3:
            crear_categoria()
        elif numero_menu == 6:
            finalizar_programa()


# MENU 1 - LEER RECETA
# Muestra en forma de lista y enumeradas, pide un numero al usuario, lo valida y devuelve el nombre de la categoria
def mostrar_categorias():
    ruta = recetas
    categorias = []

    # Imprimir la lista de categorias
    def lista_categorias():
        nonlocal categorias
        if ruta.is_dir():
            categorias = [x for x in ruta.iterdir() if x.is_dir()]

            for i, cate in enumerate(categorias, start=1):
                print(f"[{i}] - {cate.name}")
        else:
            print("La ruta no es un directorio válido.")

    lista_categorias()
    numero_de_categorias = len(categorias)
    opcion_categoria = (input('\nElije una opcion: '))

    while True:
        if opcion_categoria.isdigit() and int(opcion_categoria) in range(1, numero_de_categorias + 1):
            system('cls')
            opcion_categoria_elegida = categorias[int(opcion_categoria) - 1].stem
            return opcion_categoria_elegida

        system('cls')
        lista_categorias()
        print('\nOpción incorrecta.')
        opcion_categoria = input('\nElije una opcion: ')


# Mostrar recetas en forma de lista y enumeradas y elegir una receta y devuelve nombre de la receta elegida
def elegir_receta():
    ruta = recetas
    mostrar_categorias_var = mostrar_categorias()
    ruta_categoria = Path(ruta, mostrar_categorias_var)
    recetasvar = []

    def lista_recetas():
        nonlocal recetasvar
        if ruta_categoria.is_dir():
            recetasvar = [x for x in ruta_categoria.iterdir() if x.glob('*.txt')]

            for i, receta in enumerate(recetasvar, start=1):
                print(f'[{i}] - {receta.stem}')

    lista_recetas()
    numero_de_recetas = len(recetasvar)
    opcion_receta = input('\nElije una receta: ')

    while True:
        if opcion_receta.isdigit() and int(opcion_receta) in range(1, numero_de_recetas + 1):
            system('cls')
            opcion_receta_elegida = recetasvar[int(opcion_receta) - 1].stem
            return ruta_categoria, opcion_receta_elegida

        system('cls')
        lista_recetas()
        print('\nOpción incorrecta.')
        opcion_receta = input('\nElije una receta: ')


# Mustra en pantalla el texto de la receta elegida
def leer_receta():
    mostrar_recetas_ruta, mostrar_recetas_var = elegir_receta()
    ruta_receta = Path(mostrar_recetas_ruta, mostrar_recetas_var + '.txt')
    ruta_receta_leer = ruta_receta.read_text()
    print(ruta_receta_leer)

    print('\n¿Volver al menú principal?')
    volver = input('\n[ s / n ] ')

    if volver == 's':
        system('cls')
        bienvenida_categorias()


# MENU 2 - CREAR RECETA
# Crear nombre y descripcion de la receta
def crear_nombre():
    # Ruta de la categoria
    ruta = recetas
    mostrar_categorias_var = mostrar_categorias()

    # Nombre y contenido
    nombre_elegido = input('Dale un nombre a tu receta: ')
    system('cls')
    contenido = input('Escribe tu receta: ')
    system('cls')

    ruta_categoria = Path(ruta, mostrar_categorias_var, nombre_elegido + '.txt')

    # Contenido del archivo
    with open(ruta_categoria, 'w') as archivo:
        archivo.write(contenido)

    def leer_o_volver():
        opciones_validas = ['1', '2', '3']

        while True:
            print(f'\n¿Quieres leer tu receta o volver al menu principal?'
                  f'\n[1] - Leer receta'
                  f'\n[2] - Menu Principal'
                  f'\n[3] - Finalizar programa')
            print('Opcion incorrecta.')
            eleccion_ = input('[1 / 2 / 3] ')

            if eleccion_ in opciones_validas:
                system('cls')
                return eleccion_

    eleccion_validada = leer_o_volver()

    if eleccion_validada == '1':
        while True:
            system('cls')
            print(f'\nNombre de tu receta: {ruta_categoria.name}')
            print(f'\nDescripcion de tu receta: '
                  f'\n{ruta_categoria.read_text()}\n')
            print(f'\n¿Quieres leer tu receta nuevamente o volver al menu principal?'
                  f'\n[1] - Leer receta nuevamente'
                  f'\n[2] - Menu Principal'
                  f'\n[3] - Finalizar programa')
            eleccion = input('[1 / 2 / 3] ')

            if eleccion == '1':
                continue  # Continuar con la siguiente iteración del bucle
            elif eleccion == '2':
                system('cls')
                break  # Salir del bucle
            elif eleccion == '3':
                finalizar_programa()
                break  # Salir del bucle
            else:
                print('Opción incorrecta. Por favor, elige una opción válida.')
    elif eleccion_validada == '3':
        finalizar_programa()


# MENU 3 - CREAR CATEGORIA
def crear_categoria():
    ruta = recetas
    categorias = []

    # Imprimir la lista de categorias
    def list_categorias():
        nonlocal categorias
        if ruta.is_dir():
            categorias = [x for x in ruta.iterdir() if x.is_dir()]

            for i, cate in enumerate(categorias, start=1):
                print(f"[{i}] - {cate.name}")
        else:
            print("La ruta no es un directorio válido.")

    def crear_o_volver():
        opciones_validas = ['1', '2', '3', '4']

        while True:
            print(f'\n¿Qué quieres hacer?'
                  f'\n[1] - Ver las categorias'
                  f'\n[2] - Crear nueva'
                  f'\n[3] - Menu Principal'
                  f'\n[4] - Finalizar programa')
            eleccion_ = input('[1 / 2 / 3 / 4] ')

            if eleccion_ in opciones_validas:
                system('cls')
                return eleccion_

    print('\nCategorías actuales:')
    list_categorias()
    nombre_categoria = input('\nDefine tu categoría: ')
    nueva_ruta = Path(ruta, nombre_categoria)
    nueva_ruta.mkdir(exist_ok=True)
    system('cls')

    eleccion_validada = crear_o_volver()

    if eleccion_validada == '1' or eleccion_validada == '2':
        while True:
            print('\nCategorías actuales:')
            list_categorias()
            print(f'\n¿Qué quieres hacer?'
                  f'\n[1] - Ver las categorias'
                  f'\n[2] - Crear nueva'
                  f'\n[3] - Menu Principal'
                  f'\n[4] - Finalizar programa')
            eleccion = input('[1 / 2 / 3 / 4] ')

            if eleccion == '1':
                system('cls')
                continue  # Continuar con la siguiente iteración del bucle
            elif eleccion == '2':
                system('cls')
                print('\nCategorías actuales:')
                list_categorias()
                nombre_categoria = input('\nDefine tu categoría: ')
                nueva_ruta = Path(ruta, nombre_categoria)
                nueva_ruta.mkdir(exist_ok=True)
                system('cls')
                continue  # Salir del bucle
            elif eleccion == '3':
                system('cls')
                break  # Salir del bucle
            elif eleccion == '4':
                finalizar_programa()
                break  # Salir del bucle
            else:
                print('Opción incorrecta. Por favor, elige una opción válida.')
    elif eleccion_validada == '4':
        finalizar_programa()


# MENU 6 - FINALIZAR PROGRAMA
def finalizar_programa():
    raise SystemExit


bienvenida_categorias()
