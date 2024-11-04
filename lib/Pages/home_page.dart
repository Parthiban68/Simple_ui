import 'dart:html';
import 'dart:js';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ui/Pages/bloc/home_page_bloc.dart';
import 'package:simple_ui/Utils/smart_device_ui.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final double horizontalpadding = 40;
  final double verticalpadding = 25;
  bool theme = false;

  List smartdevices = [
    ['smart Light', 'lib/icons/light-bulb.png', true],
    ['smart AC', 'lib/icons/air-conditioner.png', false],
    ['smart TV', 'lib/icons/smart-tv.png', false],
    ['smart Fan', 'lib/icons/fan.png', false],
  ];

  void onTheme() {
    setState(() {
      theme = !theme;
    });
  }

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      smartdevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final HomePageBloc homePageBloc = HomePageBloc();
    return BlocProvider(
      create: (context) => homePageBloc,
      child: BlocConsumer(
        bloc: homePageBloc,
        listenWhen: (previous, current) => current is HomePageActionState,
        listener: (context, state) {
          if (state is HomePageThemeToggleActionState) {
            onTheme();
          }
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: theme ? Colors.black : Colors.white,
              body: SafeArea(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: horizontalpadding,
                        vertical: verticalpadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'lib/icons/menu.png',
                          height: 45,
                          color: theme ? Colors.white : Colors.grey[900],
                        ),
                        Icon(
                          Icons.person,
                          size: 45,
                          color: theme ? Colors.white : Colors.grey[900],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalpadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome Back',
                            style: TextStyle(
                                fontSize: 20,
                                color: theme ? Colors.white : Colors.black)),
                        Text(
                          'Parthiban',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: theme ? Colors.white : Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: horizontalpadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Smart Devices',
                            style: TextStyle(
                                fontSize: 20,
                                color: theme ? Colors.white : Colors.black)),
                        CupertinoSwitch(
                          value: theme,
                          // onChanged: (value) => onTheme(value),
                          onChanged: (theme) {
                            homePageBloc.add(HomePageThemeToggleEvent());
                          },
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      child: GridView.builder(
                          itemCount: smartdevices.length,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.all(15),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                          itemBuilder: (context, index) {
                            return SmartDeviceBox(
                              smartDeviceName: smartdevices[index][0],
                              iconpath: smartdevices[index][1],
                              powerOn: smartdevices[index][2],
                              onchanged: (value) =>
                                  powerSwitchChanged(value, index),
                            );
                          }))
                ],
              )));
        },
      ),
    );
  }
}
