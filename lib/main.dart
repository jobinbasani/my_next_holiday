import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_next_holiday/services/HolidayService.dart';
import 'package:my_next_holiday/services/CanadaHolidayService.dart';
import 'package:my_next_holiday/services/UsaHolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';

void main() => runApp(new NlwApp());

class NlwApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Next Holiday',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(title: 'My Next Holiday'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dropdownMenuOptions;
  List<String> _countryList = [];
  String _selectedCountry;
  Map<String, HolidayService> _serviceMap = new HashMap();
  Map<String, List<HolidayDetails>> holidayDetailsMap = new HashMap();
  final List<HolidayService> _holidayServices = [
    new UsaHolidayService(),
    new CanadaHolidayService()
  ];

  Widget _buildHolidayList() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: holidayDetailsMap[_selectedCountry].length,
        itemBuilder: (context, index) {
          return new Card(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Container(
                          padding: const EdgeInsets.all(9.0),
                          child: new Text(
                            "2019",
                            style: new TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        new CircleAvatar(
                          backgroundColor: Colors.lightGreen,
                          child: new Text(holidayDetailsMap[_selectedCountry]
                              .elementAt(index)
                              .holidayDate
                              .day
                              .toString()),
                        ),
                        new Container(
                          padding: const EdgeInsets.all(9.0),
                          child: new Text("JUNE",
                              style:
                                  new TextStyle(fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    new Expanded(
                      child: new Banner(
                        message: "SAT",
                        location: BannerLocation.topEnd,
                        child: new ListTile(
                          title: new Text(holidayDetailsMap[_selectedCountry]
                              .elementAt(index)
                              .holidayName),
                          subtitle: new Text(holidayDetailsMap[_selectedCountry]
                              .elementAt(index)
                              .holidayDetails),
                        ),
                      ),
                    ),
                  ],
                ),
                new Divider(),
                new Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.all(9.0),
                      child: new Text("5 days to go",
                          style: new TextStyle(fontStyle: FontStyle.italic)),
                    ),
                    new Expanded(
                        child: new Align(
                      alignment: Alignment.centerRight,
                      child: new ButtonTheme.bar(
                        // make buttons use the appropriate styles for cards
                        child: new ButtonBar(
                          children: <Widget>[
                            new FlatButton(
                              child: const Text('READ MORE'),
                              onPressed: () {
                                /* ... */
                              },
                            ),
                            new FlatButton(
                              child: const Text('SHARE'),
                              onPressed: () {
                                /* ... */
                              },
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _holidayServices.forEach((service) {
      _countryList.add(service.getCountry());
      _serviceMap.putIfAbsent(service.getCountry(), () => service);
      holidayDetailsMap.putIfAbsent(service.getCountry(), () => []);
    });
    _countryList.sort();
    _selectedCountry = _countryList.first;
    dropdownMenuOptions = _countryList
        .map((String item) =>
            new DropdownMenuItem<String>(value: item, child: new Text(item)))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    if (holidayDetailsMap[_selectedCountry].isEmpty) {
      print("Loaing for first time");
      holidayDetailsMap[_selectedCountry]
          .addAll(_serviceMap[_selectedCountry].getHolidays(18 * 30));
    }

    print(holidayDetailsMap[_selectedCountry]);

    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(
                    child: new Container(
                  padding: const EdgeInsets.all(10.0),
                  child: new DropdownButtonHideUnderline(
                      child: new DropdownButton<String>(
                    value: _selectedCountry,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                    items: dropdownMenuOptions,
                    onChanged: (s) {
                      setState(() {
                        _selectedCountry = s;
                      });
                    },
                  )),
                ))
              ],
            ),
            new Expanded(
              child: _buildHolidayList(),
            ),
          ],
        ),
      ),
    );
  }
}
