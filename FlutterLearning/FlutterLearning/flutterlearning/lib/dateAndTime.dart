import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DateAndTimeApp extends StatelessWidget {
  const DateAndTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Date and Time'),
          ),
          body: ListView(
            children: const [
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: DatePage(),
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: TimePage(),
              )
            ],
          ),
        ),
        localizationsDelegates: const [
          //此处
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          //此处
          Locale('zh', 'CH'),
          // Locale('en', 'US'),
        ],
    );
  }
}

class DatePage extends StatefulWidget {
  const DatePage({super.key});

  @override
  State<DatePage> createState() => _DatePageState();
}

class _DatePageState extends State<DatePage> {
  DateTime _datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${_datetime.year}-${_datetime.month}-${_datetime.day}"),
            const Icon(Icons.arrow_drop_down)
          ],
        ),
        onTap: () async {
          DateTime? datetime = await showDatePicker(
              context: context,
              initialDate: _datetime,
              firstDate: DateTime(1900),
              lastDate: DateTime(2050),
            locale: const Locale('zh'),
          );
          if (datetime != null) {
            setState(() {
              _datetime = datetime;
            });
          }
        });
  }
}

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  TimeOfDay _time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${_time.hour}:${_time.minute}"),
          const Icon(Icons.arrow_drop_down)
        ],
      ),
      onTap: () async {
        TimeOfDay? time =
        await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child!,
            );
          },
          initialEntryMode: TimePickerEntryMode.input
        );
        if (time != null) {
          setState(() {
            _time = time;
          });
        }
      },
    );
  }
}
