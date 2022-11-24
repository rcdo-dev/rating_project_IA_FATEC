import 'package:flutter/material.dart';

import 'package:rating_project/app/widgets/rate_widget.dart';

class StationFuelCard extends StatefulWidget {
  final String stationName;
  final String stationAddress;

  const StationFuelCard({
    super.key,
    required this.stationName,
    required this.stationAddress,
  });

  @override
  State<StationFuelCard> createState() => _StationFuelCardState();
}

class _StationFuelCardState extends State<StationFuelCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: double.infinity,
          height: 93,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.stationName,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Localização: ${widget.stationAddress}'),
                  ],
                ),
              ),
              const Expanded(
                child: RateWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
