import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_next_holiday/services/AustraliaHolidayService.dart';
import 'package:my_next_holiday/services/HolidayService.dart';
import 'package:my_next_holiday/services/CanadaHolidayService.dart';
import 'package:my_next_holiday/services/UkHolidayService.dart';
import 'package:my_next_holiday/services/UsaHolidayService.dart';
import 'package:my_next_holiday/vo/HolidayDetails.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:share/share.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:io' show Platform;

void main() => runApp(NlwApp());

class NlwApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Next Holiday',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: NlwHomePage(title: 'My Next Holiday'),
    );
  }
}

class NlwHomePage extends StatefulWidget {
  NlwHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _NlwHomePageState createState() => _NlwHomePageState();
}

class _NlwHomePageState extends State<NlwHomePage> {
  static const platform = MethodChannel('com.jobinbasani.nlw/services');
  static const COUNTRY_KEY = "country";
  List<DropdownMenuItem<String>>? dropdownMenuOptions;
  List<String> _countryList = [];
  String? _selectedCountry;
  Map<String, HolidayService> _serviceMap = HashMap();
  Map<String, List<HolidayDetails>> holidayDetailsMap = HashMap();
  var _monthFormatter = DateFormat("MMM");
  var _weekDayFormatter = DateFormat("E");
  late SharedPreferences prefs;
  final Color holidayWeekLabelColor = Colors.deepOrange;
  final _padding = const EdgeInsets.all(9.0);
  final DateTime _startDate = DateTime.now().subtract(Duration(days: 30 * 6));
  final DateTime _endDate = DateTime.now().add(Duration(days: 30 * 18));
  final firstKey = GlobalKey();
  final nlwKey = GlobalKey();
  final centerColumnKey = GlobalKey();
  late double firstCardHeight;
  AutoScrollController scrollController = AutoScrollController();
  bool _isNextHolidayVisible = true;
  bool _isScrollTriggered = false;
  bool _isScrollUp = true;
  double _nlwPosition = 0.0;
  final String defaultCountryCode = "US";

  final List<HolidayService> _holidayServices = [
    UsaHolidayService(),
    CanadaHolidayService(),
    AustraliaHolidayService(),
    UkHolidayService()
  ];

  Widget getFab() {
    return Opacity(
      opacity: _isNextHolidayVisible ? 0.0 : 1.0,
      child: FloatingActionButton(
        onPressed: () {
          scrollToNextHoliday();
        },
        child: Icon(_isScrollUp ? Icons.arrow_upward : Icons.arrow_downward),
      ),
    );
  }

  Widget getDaysToGo(HolidayDetails details) {
    String data =
        "${details.daysDiff} ${Intl.plural(details.daysDiff, one: "day", other: "days")}";
    return Text(details.isPast ? "$data ago" : "$data to go",
        style: TextStyle(fontStyle: FontStyle.italic));
  }

  Future<void> launchCalendar(HolidayDetails details) async {
    if (Platform.isAndroid) {
      await platform.invokeMethod('openCalender',
          details.holidayDate.millisecondsSinceEpoch.toString());
    }
  }

  Widget getDateAvatar(HolidayDetails details) {
    return CircleAvatar(
      backgroundColor:
      details.isNextHoliday ? Colors.lightGreen : Colors.black45,
      foregroundColor: Colors.white,
      child: Text(details.holidayDate.day.toString()),
    );
  }

  Widget getHolidayDetailsTile(HolidayDetails details) {
    return Expanded(
      child: ListTile(
        title: Text(
          details.holidayName,
          style: TextStyle(
              fontWeight:
              details.isNextHoliday ? FontWeight.bold : FontWeight.normal),
        ),
        subtitle: Text(details.holidayDetails),
      ),
    );
  }

  Widget getDateInfoBlock(HolidayDetails details) {
    return GestureDetector(
      onTap: () {
        launchCalendar(details);
      },
      child: Column(
        children: <Widget>[
          Container(
            padding: _padding,
            child: Text(
              details.holidayDate.year.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: details.isNextHoliday ? Colors.green : Colors.black),
            ),
          ),
          getDateAvatar(details),
          Container(
            padding: _padding,
            child: Text(
                _monthFormatter.format(details.holidayDate).toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                    details.isNextHoliday ? Colors.green : Colors.black)),
          )
        ],
      ),
    );
  }

  void shareDetails(HolidayDetails details) {
    Share.share(
        "${details.holidayName} on ${_monthFormatter.format(details.holidayDate)} ${details.holidayDate.day}, ${details.holidayDate.year}."
            "\n${details.holidayDetails}"
            "\nRead more at ${details.url}");
  }

  void onListScroll() {
    setState(() {
      _isScrollTriggered = true;
      _isNextHolidayVisible = nlwKey.currentWidget != null;
      if (_isNextHolidayVisible) {
        _nlwPosition = scrollController.position.pixels;
      }
      _isScrollUp = scrollController.position.pixels > _nlwPosition;
    });
  }

  Widget getButtonBar(HolidayDetails details) {
    List<Widget> buttons = [];
    buttons.add(TextButton(
      style: TextButton.styleFrom(
        foregroundColor: details.isNextHoliday ? Colors.green : Colors.black,
      ),
      child: const Text('READ MORE'),
      onPressed: () {
        _launchURL(details.url);
      },
    ));
    if (details.isNextHoliday) {
      buttons.add(TextButton(
        child: const Text('SHARE'),
        onPressed: () {
          shareDetails(details);
        },
      ));
    }
    return Align(
      alignment: Alignment.centerRight,
      child: ButtonBar(
        children: buttons,
      ),
    );
  }

  Widget getWeekdayLabel(HolidayDetails details) {
    return Container(
      child: Text(
        _weekDayFormatter.format(details.holidayDate).toUpperCase(),
        style: TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
          color: details.isNextHoliday ? holidayWeekLabelColor : Colors.grey),
      padding: const EdgeInsets.all(3.0),
      margin: const EdgeInsets.all(5.0),
    );
  }

  void onCountrySelectionChange(String country) {
    setState(() {
      _selectedCountry = country;
      loadHolidayInfo();
      prefs.setString(COUNTRY_KEY, country);
      _isScrollTriggered = false;
    });
  }

  Widget _getDropDownWidget() {
    return Row(children: <Widget>[
      Expanded(
          child: Container(
            padding: _padding,
            child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCountry,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
                  items: dropdownMenuOptions,
                  onChanged: (s) {
                    if (s != null) {
                      onCountrySelectionChange(s);
                    }
                  },
                )),
          ))
    ]);
  }

  int getNextHolidayIndex() {
    List<HolidayDetails> holidayDetails =
        holidayDetailsMap[_selectedCountry] ?? [];
    int index = holidayDetails.indexWhere((holidayInfo) => !holidayInfo.isPast);
    return index;
  }

  Widget _getHolidayListView() {
    return Expanded(
        child: ListView.builder(
            controller: scrollController,
            padding: _padding,
            itemCount: holidayDetailsMap[_selectedCountry]?.length ?? 0,
            itemBuilder: (context, index) {
              var key;
              if (index == 0) {
                key = firstKey;
              } else if (index == getNextHolidayIndex()) {
                key = nlwKey;
              }
              Widget cardWidget = getCard(
                  holidayDetailsMap[_selectedCountry]!.elementAt(index),
                  key != null ? key : ValueKey(index));
              return AutoScrollTag(
                key: ValueKey(index),
                controller: scrollController,
                index: index,
                child:
                Stack(alignment: Alignment.topRight, children: <Widget>[
                  cardWidget,
                  getWeekdayLabel(
                      holidayDetailsMap[_selectedCountry]!.elementAt(index))
                ]),
              );
            }));
  }

  Widget getCard(HolidayDetails details, Key key) {
    return Card(
      key: key,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              getDateInfoBlock(details),
              getHolidayDetailsTile(details),
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Container(
                padding: _padding,
                child: getDaysToGo(details),
              ),
              getButtonBar(details)
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    } else {
      throw 'Could not launch $url';
    }
  }

  void scrollToNextHoliday() {
    scrollController.scrollToIndex(getNextHolidayIndex(),
        preferPosition: AutoScrollPosition.middle);
    handleTip();
  }

  void loadHolidayInfo() {
    if (holidayDetailsMap[_selectedCountry]!.isEmpty) {
      holidayDetailsMap[_selectedCountry]?.addAll(_serviceMap[_selectedCountry]
          ?.getHolidays(_startDate, _endDate) as Iterable<HolidayDetails>);
    }
  }

  void initState() {
    super.initState();
    initializePreferences().then((_) {
      _holidayServices.forEach((service) {
        _countryList.add(service.getCountry());
        _serviceMap.putIfAbsent(service.getCountry(), () => service);
        holidayDetailsMap.putIfAbsent(service.getCountry(), () => []);
      });
      _countryList.sort();
      getDefaultSelectedCountry().then((selection) {
        setState(() {
          onCountrySelectionChange(selection);
          dropdownMenuOptions = _countryList
              .map((String item) => DropdownMenuItem<String>(
              value: item, child: Text(item)))
              .toList();
        });
      });
    });
    scrollController.addListener(onListScroll);
  }

  Future<String> getDefaultSelectedCountry() async {
    // Ensure prefs is initialized before using it
    if (!prefs.containsKey(COUNTRY_KEY)) {
      // If prefs is not initialized or COUNTRY_KEY is not set, return a default value
      return _holidayServices
          .firstWhere((holidayService) =>
      holidayService.getCountryCode() == defaultCountryCode)
          .getCountry();
    }
    String country = prefs.getString(COUNTRY_KEY) ??
        _holidayServices
            .firstWhere((holidayService) =>
        holidayService.getCountryCode() == defaultCountryCode)
            .getCountry();
    return _countryList.contains(country) ? country : _countryList.first;
  }

  Future<void> initializePreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void handleTip() {
    if (prefs.getBool("hintShown") != true) {
      final BuildContext? context = centerColumnKey.currentContext;
      if (context != null) {
        final scaffoldMessenger = ScaffoldMessenger.of(context);
        scaffoldMessenger.showSnackBar(
          SnackBar(
            duration: Duration(seconds: 30),
            content: Text("Switch country using the top dropdown!"),
            action: SnackBarAction(
              label: 'OK',
              onPressed: () {
                scaffoldMessenger
                    .hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
              },
            ),
          ),
        );
        prefs.setBool("hintShown", true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isScrollTriggered) {
      WidgetsBinding.instance
          .scheduleFrameCallback((_) => scrollToNextHoliday());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          key: centerColumnKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _getDropDownWidget(),
              _selectedCountry != null ? _getHolidayListView() : Container(),
            ],
          ),
        );
      }),
      floatingActionButton: getFab(),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
