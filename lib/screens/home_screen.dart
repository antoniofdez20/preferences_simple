import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:preferences_simple/controllers/contador_controller.dart';

/*
  * Página principal la cual va a mostrar el valor actual del contador
  * A de más permite al usuario incrementar, decrementar o reseat el valor de dicho contador
*/
class HomeScreen extends StatelessWidget {
  static const String routerName = 'home';
  final ContadorController counterController = Get.put(ContadorController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Counter Shared Preferences'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Obx nos va a permitir refrescar exclusivamente el widget que englobemos
            //al usar obx dentro solo puedo usar variables de getx
            //si hubiera querido mostrar directamente la variable de Preferences tenia que usar GetBuilder
            Obx(() => Text(
                  'Contador: ${counterController.count.value}',
                  style: const TextStyle(fontSize: 33),
                )),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => counterController.decrement(),
                  tooltip: 'Decrementar',
                  child: const Icon(Icons.remove),
                ),
                const SizedBox(width: 16.0),
                FloatingActionButton(
                  onPressed: () => counterController.reset(),
                  tooltip: 'Resetear',
                  child: const Icon(Icons.refresh),
                ),
                const SizedBox(width: 16.0),
                FloatingActionButton(
                  onPressed: () => counterController.increment(),
                  tooltip: 'Incrementar',
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
