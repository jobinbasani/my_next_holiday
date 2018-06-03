import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_next_holiday/services/HolidayService.dart';
import 'package:my_next_holiday/services/CanadaHolidayService.dart';
import 'package:my_next_holiday/services/UsaHolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share/share.dart';
import 'dart:io' show Platform;

void main() => runApp(new NlwApp());

class NlwApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Next Holiday',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new NlwHomePage(title: 'My Next Holiday'),
    );
  }
}

class NlwHomePage extends StatefulWidget {
  NlwHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _NlwHomePageState createState() => new _NlwHomePageState();
}

class _NlwHomePageState extends State<NlwHomePage> {
  static const platform = const MethodChannel('com.jobinbasani.nlw/services');
  static const COUNTRY_KEY = "country";
  var dropdownMenuOptions;
  List<String> _countryList = [];
  String _selectedCountry;
  Map<String, HolidayService> _serviceMap = new HashMap();
  Map<String, List<HolidayDetails>> holidayDetailsMap = new HashMap();
  var _monthFormatter = new DateFormat("MMM");
  var _weekDayFormatter = new DateFormat("E");
  SharedPreferences prefs;
  final Color redColor = const Color(0xA0B71C1C);
  final _padding = const EdgeInsets.all(9.0);
  final DateTime _startDate = DateTime.now().subtract(new Duration(days: 30*6));
  final DateTime _endDate = DateTime.now().add(new Duration(days: 30*18));

  final List<HolidayService> _holidayServices = [
    new UsaHolidayService(),
    new CanadaHolidayService()
  ];

  Widget getDaysToGo(HolidayDetails details) {
    String data = "${details.daysDiff} ${Intl.plural(
        details.daysDiff, one: "day", other: "days")}";
    return new Text(details.isPast ? "${data} ago" : "${data} to go",
        style: new TextStyle(fontStyle: FontStyle.italic));
  }

  Future<String> getDefaultSelectedCountry() async {
    String country = prefs.getString(COUNTRY_KEY) ?? _countryList.first;
    return _countryList.contains(country) ? country : _countryList.first;
  }

  Future<Null> launchCalendar(HolidayDetails details) async {
    if (Platform.isAndroid) {
      await platform.invokeMethod('openCalender',
          details.holidayDate.millisecondsSinceEpoch.toString());
    }
  }

  Widget getDateAvatar(HolidayDetails details) {
    return new CircleAvatar(
      backgroundColor:
          details.isNextHoliday ? Colors.lightGreen : Colors.black45,
      foregroundColor: Colors.white,
      child: new Text(details.holidayDate.day.toString()),
    );
  }

  Widget getHolidayDetailsTile(HolidayDetails details) {
    return new Expanded(
      child: new ListTile(
        title: new Text(
          details.holidayName,
          style: new TextStyle(
              fontWeight:
                  details.isNextHoliday ? FontWeight.bold : FontWeight.normal),
        ),
        subtitle: new Text(details.holidayDetails),
      ),
    );
  }

  Widget getDateInfoBlock(HolidayDetails details) {
    return new GestureDetector(
      onTap: () {
        launchCalendar(details);
      },
      child: new Column(
        children: <Widget>[
          new Container(
            padding: _padding,
            child: new Text(
              details.holidayDate.year.toString(),
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: details.isNextHoliday ? Colors.green : Colors.black),
            ),
          ),
          getDateAvatar(details),
          new Container(
            padding: _padding,
            child: new Text(
                _monthFormatter.format(details.holidayDate).toUpperCase(),
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        details.isNextHoliday ? Colors.green : Colors.black)),
          )
        ],
      ),
    );
  }

  void shareDetails(HolidayDetails details) {
    Share.share("${details.holidayName} on ${_monthFormatter.format(
        details.holidayDate)} ${details.holidayDate.day}, ${details.holidayDate
        .year}."
        "\n${details.holidayDetails}"
        "\nRead more at ${details.url}");
  }

  Widget getButtonBar(HolidayDetails details) {
    List<Widget> buttons = [];
    buttons.add(new FlatButton(
      textColor: details.isNextHoliday ? Colors.green : Colors.black,
      child: const Text('READ MORE'),
      onPressed: () {
        _launchURL(details.url);
      },
    ));
    if (details.isNextHoliday) {
      buttons.add(new FlatButton(
        child: const Text('SHARE'),
        onPressed: () {
          shareDetails(details);
        },
      ));
    }
    return new Expanded(
        child: new Align(
      alignment: Alignment.centerRight,
      child: new ButtonTheme.bar(
        child: new ButtonBar(
          children: buttons,
        ),
      ),
    ));
  }

  Widget getWeekdayLabel(HolidayDetails details) {
    return new Container(
      child: new Text(
        _weekDayFormatter.format(details.holidayDate).toUpperCase(),
        style: new TextStyle(color: Colors.white),
      ),
      decoration: new BoxDecoration(
          color: details.isNextHoliday ? redColor : Colors.grey),
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.all(5.0),
    );
  }

  Widget _getDropDownWidget() {
    return new Row(children: <Widget>[
      new Expanded(
          child: new Container(
        padding: const EdgeInsets.all(10.0),
        child: new DropdownButtonHideUnderline(
            child: new DropdownButton<String>(
          value: _selectedCountry,
          style:
              new TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
          items: dropdownMenuOptions,
          onChanged: (s) {
            setState(() {
              _selectedCountry = s;
              loadHolidayInfo();
              prefs.setString(COUNTRY_KEY, s);
            });
          },
        )),
      ))
    ]);
  }

  Widget _getHolidayListView() {
    return new Expanded(
        child: new ListView.builder(
            padding: _padding,
            itemCount: holidayDetailsMap[_selectedCountry].length,
            itemBuilder: (context, index) {
              return new Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  new Card(
                    child: new Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            getDateInfoBlock(holidayDetailsMap[_selectedCountry]
                                .elementAt(index)),
                            getHolidayDetailsTile(
                                holidayDetailsMap[_selectedCountry]
                                    .elementAt(index)),
                          ],
                        ),
                        new Divider(),
                        new Row(
                          children: <Widget>[
                            new Container(
                              padding: _padding,
                              child: getDaysToGo(
                                  holidayDetailsMap[_selectedCountry]
                                      .elementAt(index)),
                            ),
                            getButtonBar(holidayDetailsMap[_selectedCountry]
                                .elementAt(index))
                          ],
                        ),
                      ],
                    ),
                  ),
                  getWeekdayLabel(
                      holidayDetailsMap[_selectedCountry].elementAt(index))
                ],
              );
            }));
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void loadHolidayInfo() {
    if (holidayDetailsMap[_selectedCountry].isEmpty) {
      print("Loaing for first time");
      holidayDetailsMap[_selectedCountry]
          .addAll(_serviceMap[_selectedCountry].getHolidays(_startDate,_endDate));
    }
    print(holidayDetailsMap[_selectedCountry]);
  }

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sharedPreferences) {
      prefs = sharedPreferences;
      _holidayServices.forEach((service) {
        _countryList.add(service.getCountry());
        _serviceMap.putIfAbsent(service.getCountry(), () => service);
        holidayDetailsMap.putIfAbsent(service.getCountry(), () => []);
      });
      _countryList.sort();
      return getDefaultSelectedCountry();
    }).then((selection) {
      setState(() {
        _selectedCountry = selection;
        loadHolidayInfo();
        dropdownMenuOptions = _countryList
            .map((String item) => new DropdownMenuItem<String>(
                value: item, child: new Text(item)))
            .toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedCountry == null) {
      return new Container();
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _getDropDownWidget(),
            _getHolidayListView(),
          ],
        ),
      ),
    );
  }
}
