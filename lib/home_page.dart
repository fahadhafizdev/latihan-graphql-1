import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_graphql_1/controller/count_controller.dart';
import 'package:latihan_graphql_1/controller/country_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CountController countController = Get.put(CountController());
    final CountryController countryController = Get.put(CountryController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: 'detail',
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.navigate_next_outlined),
        onPressed: () => countController.add(),
      ),
      appBar: AppBar(
        title: Text('Belajar Graphql'),
      ),
      body: Obx(() => Text('${countController.count.value}')),
    );
  }
}
