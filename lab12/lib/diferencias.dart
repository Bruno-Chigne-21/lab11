import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DiferenciasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diferencias'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Cupertino'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Switch'),
                CupertinoSwitchExample(),
                Text('Calendario'),
                CupertinoDatePickerExample(),
              ],
            ),
          ),
          ListTile(
            title: Text('Material'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Switch'),
                SwitchExample(),
                Text('Calendario'),
                DatePickerExample(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget Switch de Material
class SwitchExample extends StatefulWidget {
  const SwitchExample({Key? key}) : super(key: key);

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: light,
      activeColor: Colors.red,
      onChanged: (bool value) {
        setState(() {
          light = value;
        });
      },
    );
  }
}

// Widget DatePicker de Material
class DatePickerExample extends StatefulWidget {
  const DatePickerExample({Key? key}) : super(key: key);

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _selectDate(context),
      child: Text('Select date'),
    );
  }
}

// Widget Switch de Cupertino
class CupertinoSwitchExample extends StatefulWidget {
  const CupertinoSwitchExample({Key? key}) : super(key: key);

  @override
  State<CupertinoSwitchExample> createState() => _CupertinoSwitchExampleState();
}

class _CupertinoSwitchExampleState extends State<CupertinoSwitchExample> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: switchValue,
      activeColor: CupertinoColors.activeBlue,
      onChanged: (bool? value) {
        setState(() {
          switchValue = value ?? false;
        });
      },
    );
  }
}

// Widget DatePicker de Cupertino
class CupertinoDatePickerExample extends StatefulWidget {
  const CupertinoDatePickerExample({Key? key}) : super(key: key);

  @override
  State<CupertinoDatePickerExample> createState() =>
      _CupertinoDatePickerExampleState();
}

class _CupertinoDatePickerExampleState extends State<CupertinoDatePickerExample> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) {
            return SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                initialDateTime: selectedDate,
                onDateTimeChanged: (DateTime newDateTime) {
                  setState(() {
                    selectedDate = newDateTime;
                  });
                },
              ),
            );
          },
        );
      },
      child: Text('Select date'),
    );
  }
}
