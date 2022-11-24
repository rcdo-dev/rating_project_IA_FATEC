import 'package:flutter/material.dart';

import 'package:rating_project/app/controller/controller_state.dart';
import 'package:rating_project/app/controller/station_fuel_controller.dart';
import 'package:rating_project/app/widgets/station_fuel_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = StationFuelController();

  void listenerState() {
    controller.stateApp.addListener(() {
      if (controller.stateApp.value == ControllerState.success || controller.stateApp.value == ControllerState.loading) {
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    super.initState();
    listenerState();
    controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Postos de combustíveis',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: controller.stateApp.value == ControllerState.success
          ? ListView.builder(
              itemCount: controller.names.length,
              itemBuilder: (context, index) {
                return StationFuelCard(
                  stationName: controller.names[index],
                  stationAddress: controller.address[index],
                );
              },
            )
          : controller.stateApp.value == ControllerState.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : controller.stateApp.value == ControllerState.error
                  ? const Center(
                      child: Text('Erro na requisição'),
                    )
                  : const SizedBox(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.stateApp.value = ControllerState.loading;
          Future.delayed(const Duration(seconds: 1)).then((value) {
            controller.getData();
          });
        },
        child: const Icon(
          Icons.search,
          size: 32,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.deepPurple,
        shape: const CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
