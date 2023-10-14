import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _IntegerExample(),
    );
  }
}

class _IntegerExample extends StatefulWidget {
  @override
  __IntegerExampleState createState() => __IntegerExampleState();
}

class __IntegerExampleState extends State<_IntegerExample> {
  int _currentValue = 3;
  List<Text> country = [
    Text('Maroco', style: TextStyle(fontSize: 30)),
    Text('Tunisia', style: TextStyle(fontSize: 30)),
    Text('Palestine', style: TextStyle(fontSize: 30)),
    Text('Egypt', style: TextStyle(fontSize: 30)),
    Text('Syria', style: TextStyle(fontSize: 30)),
    Text('Irak', style: TextStyle(fontSize: 30)),
    Text('Mauritania', style: TextStyle(fontSize: 30)),
    Text('Syria', style: TextStyle(fontSize: 30)),
    Text('Irak', style: TextStyle(fontSize: 30)),
    Text('Mauritania', style: TextStyle(fontSize: 30))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
            child: Text(
              'Push',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            onTap: () {
              showModalBottomSheet<void>(
                backgroundColor: Colors.transparent,
                context: context,
                barrierColor: Colors.transparent,
                builder: (BuildContext context) {
                  // Future.delayed(const Duration(seconds: 5), () {
                  //   Navigator.pop(context, true);
                  // });
                  return StatefulBuilder(
                      builder: (BuildContext context, setState) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  topRight: Radius.circular(60))),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: BottomPicker(
                              backgroundColor: Colors.transparent,
                              itemExtent: 40,
                              displayCloseIcon: false,
                              items: country,
                              displaySubmitButton: false,
                              selectedItemIndex: _currentValue,
                              onChange: (index) {
                                _currentValue = index;
                              },
                              title: '',
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(top: 42),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK',
                                      style: TextStyle(fontSize: 30))),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                width: MediaQuery.of(context).size.width,
                                height: 5,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  });
                },
              );
            }),
      ),
    );
  }
}
