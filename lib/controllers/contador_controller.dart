import 'package:get/get.dart';
import 'package:preferences_simple/preferences/preferences.dart';

/* 
  * CONTROLADOR DE GETX QUE NOS VA A PERMITIR REFRESCAR EN TIEMPO REAL EL VALOR DEL
  * CONTADOR YA QUE HOMESCREEN ES UN StatelessWidget 
*/
class ContadorController extends GetxController {
  //Para que la persistencia de datos sea efectiva no podia inicializar el contador a 0
  //por ello lo inicializo con el valor de la variable de SharedPreferences
  RxInt count = Preferences.number.obs;

  //En los siguientes métodos a parte de variar el valor de la variable del contador
  //tambien le asigno dicho valor a la variable de Preferences para poder persistir en el caso de cerrar la aplicacion
  void increment() {
    count.value++;
    Preferences.number = count.value;
  }

  void decrement() {
    count.value--;
    Preferences.number = count.value;
  }

  void reset() {
    count.value = 0;
    Preferences.number = count.value;
  }
}
