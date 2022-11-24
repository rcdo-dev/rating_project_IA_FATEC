import 'package:flutter/material.dart';

class RateWidget extends StatefulWidget {
  const RateWidget({
    super.key,
  });

  @override
  State<RateWidget> createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  late bool flagColorUp;
  late bool flagColorDown;

  Color? colorUp;
  Color? colorDown;

  @override
  void initState() {
    super.initState();
    flagColorUp = false;
    flagColorDown = false;

    colorUp = Colors.grey;
    colorDown = Colors.grey;
  }

  Color? changeColorUp(bool flag) {
    if (flag) {
      colorUp = Colors.green[800];
      colorDown = Colors.grey;
    }
    return colorUp;
  }

  Color? changeColorDown(bool flag) {
    if (flag) {
      colorDown = Colors.red[800];
      colorUp = Colors.grey;
    }
    return colorDown;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          const Text(
            'Combustível',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      flagColorUp = true;
                      flagColorDown = false;
                      changeColorUp(flagColorUp);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.arrow_circle_up,
                      color: colorUp,
                      size: 45,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Bom',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: colorUp,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      flagColorDown = true;
                      flagColorUp = false;
                      changeColorDown(flagColorDown);
                      setState(() {});
                    },
                    child: Icon(
                      Icons.arrow_circle_down,
                      color: colorDown,
                      size: 45,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Ruim',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: colorDown,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
