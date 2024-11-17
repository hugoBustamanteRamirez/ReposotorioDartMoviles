import 'dart:io';

void main() {
  // Menú de platillos con precios
  Map<String, double> menu = {
    'Pasta': 30.0,
    'Pizza': 50.0,
    'Ensalada': 25.0,
    'Hamburguesa': 40.0,
  };

  while (true) {
    print('''
    *** Menú de Opciones ***
    1. Mostrar todos los platillos
    2. Buscar un platillo
    3. Actualizar precio de un platillo
    4. Salir
    ''');
    stdout.write('Seleccione una opción: ');
    String? option = stdin.readLineSync();

    switch (option) {
      case '1':
        mostrarMenu(menu);
        break;
      case '2':
        stdout.write('Ingrese el nombre del platillo a buscar: ');
        String? platillo = stdin.readLineSync();
        buscarPlatillo(menu, platillo);
        break;
      case '3':
        stdout.write('Ingrese el nombre del platillo a actualizar: ');
        String? platillo = stdin.readLineSync();
        stdout.write('Ingrese el nuevo precio: ');
        String? precioStr = stdin.readLineSync();
        double? nuevoPrecio = double.tryParse(precioStr ?? '');
        if (nuevoPrecio != null) {
          actualizarPrecio(menu, platillo, nuevoPrecio);
        } else {
          print('Precio inválido. Intente de nuevo.');
        }
        break;
      case '4':
        print('Saliendo del programa...');
        return;
      default:
        print('Opción inválida. Intente de nuevo.');
    }
  }
}

// Función para mostrar todos los platillos
void mostrarMenu(Map<String, double> menu) {
  print('\n*** Menú de Platillos ***');
  menu.forEach((platillo, precio) {
    print('$platillo: \$${precio.toStringAsFixed(2)}');
  });
  print('');
}

// Función para buscar un platillo
void buscarPlatillo(Map<String, double> menu, String? platillo) {
  if (platillo != null && menu.containsKey(platillo)) {
    print('Platillo encontrado: $platillo - \$${menu[platillo]!.toStringAsFixed(2)}');
  } else {
    print('Platillo no encontrado.');
  }
}

// Función para actualizar el precio de un platillo
void actualizarPrecio(Map<String, double> menu, String? platillo, double nuevoPrecio) {
  if (platillo != null && menu.containsKey(platillo)) {
    menu[platillo] = nuevoPrecio;
    print('Precio actualizado: $platillo - \$${nuevoPrecio.toStringAsFixed(2)}');
  } else {
    print('El platillo no existe en el menú.');
  }
}
