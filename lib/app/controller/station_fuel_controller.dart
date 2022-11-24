import 'package:flutter/material.dart';

import 'package:rating_project/app/constants/constants.dart';
import 'package:rating_project/app/controller/controller_state.dart';
import 'package:rating_project/app/repositories/station_fuel_repository.dart';

class StationFuelController {
  final _repository = StationFuelRepository();
  List<String> names = [];
  List<String> address = [];

  final stateApp = ValueNotifier<ControllerState>(ControllerState.empty);
  set state(ControllerState state) => stateApp.value = state;
  ControllerState get state => stateApp.value;

  void getData() async {
    state = ControllerState.loading;
    names = await _repository.getGasStationName();
    address = await _repository.getGasStationAddress();
    cleanerList(address);
    state = ControllerState.success;
  }

  void cleanerList(List<String> list) {
    list.removeWhere((element) => (element == Constants.disposableValue1 || element == Constants.disposableValue2 || element == Constants.disposableValue3));
  }
}
