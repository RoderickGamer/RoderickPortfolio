# Bank Account

El objetivo de este programa es practicar la programación orientada a objetos, la herencia de clases, el manejo de instancias, etc. Por lo tanto, se espera que el usuario siga estrictamente las indicaciones que se le solicitan. Por esta razón, no se realiza validación de los datos ingresados por el usuario ni se contempla nada más allá del objetivo principal.

Este programa se encarga de la creación y gestión de cuentas bancarias, donde se pueden crear clientes, iniciar sesión, depositar y retirar dinero.

Al iniciar el programa, se muestra un menú de bienvenida al usuario con tres opciones: crear usuario, iniciar sesión o salir del programa.

- Crear usuario:

    Se solicita al usuario su(s) nombre(s) y apellido(s), se le asigna un saldo inicial de $0 y se le otorga un número de cuenta incremental que comienza en 1. A continuación, la función agrega al usuario a una lista de usuarios y devuelve la instancia correspondiente al usuario creado.
    
- Iniciar sesión:

    El usuario ingresa su número de cuenta y el programa busca dicho número dentro de la lista de usuarios, devolviendo la instancia correspondiente. A partir de ahí, el usuario puede elegir entre las siguientes opciones:
    
    - Depositar:
    
        El usuario ingresa un monto que se suma a su saldo actual.
        
    - Retirar:
    
        El usuario ingresa un monto a retirar. Si el monto es menor o igual a su saldo, se descuenta del mismo. En caso contrario, se muestra un mensaje de error y se le presentan nuevamente las tres opciones mencionadas anteriormente.
        
    - Volver al menú:
    
        Devuelve al usuario al menú principal.
        
- Finalizar:

    El programa se cierra.
