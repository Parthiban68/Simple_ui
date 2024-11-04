import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String smartDeviceName;
  final String iconpath;
  final bool powerOn;
  void Function(bool)? onchanged;

  SmartDeviceBox({
    super.key,
    required this.smartDeviceName,
    required this.iconpath,
    required this.powerOn,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerOn ? Colors.grey[900] : Colors.grey[400],
          borderRadius: BorderRadius.circular(24.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconpath,
                height: 65,
                color: powerOn ? Colors.white : Colors.black,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(smartDeviceName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: powerOn ? Colors.white : Colors.black)),
                    ),
                  ),
                  Transform.rotate(
                      angle: pi / 2,
                      child: CupertinoSwitch(
                        value: powerOn,
                        onChanged: onchanged,
                      )),
                ],
              )
            ]),
      ),
    );
  }
}
