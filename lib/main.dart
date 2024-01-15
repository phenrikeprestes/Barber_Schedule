import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber Shop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: BarberShopApp(),
    );
  }
}

class BarberShopApp extends StatefulWidget {
  @override
  _BarberShopAppState createState() => _BarberShopAppState();
}

class _BarberShopAppState extends State<BarberShopApp> {
  List<String> availableTimes = [
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
  ];
  String? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule a time'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select a time:',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedTime,
              hint: Text('Select a time'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedTime = newValue;
                });
              },
              items: availableTimes.map((String time) {
                return DropdownMenuItem<String>(
                  value: time,
                  child: Text(time),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedTime != null) {
// Lógica para salvar o horário selecionado
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Scheduled time '),
                        content:
                            Text('Your $selectedTime is schedule sucessfuly.'),
                        actions: [
                          ElevatedButton(
                            child: Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text(
                'Schedule',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
