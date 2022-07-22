import 'dart:developer';

import 'package:flutter/material.dart';

class GratitudePage extends StatefulWidget {
  const GratitudePage({Key? key, required this.radioGroupValue})
      : super(key: key);
  final int radioGroupValue;

  @override
  State<GratitudePage> createState() => _GratitudePageState();
}

class _GratitudePageState extends State<GratitudePage> {
  String? _selectedValue;
  final List<String> _gratitudeList = [];
  int _radioGroupValue = -1;

  _radioOnChanged(int index) {
    setState(
      () {
        _radioGroupValue = index;
        _selectedValue = _gratitudeList[index];
        log('_selectedRadioValue $_selectedValue');
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _gratitudeList
      ..add('Family')
      ..add('Friends')
      ..add('Coffee');
    _radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gratitude"),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => Navigator.pop(
              context,
              _selectedValue,
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          Radio(
            value: 0,
            groupValue: _radioGroupValue,
            onChanged: (int? index) => _radioOnChanged(index!),
          ),
          const Text('Family'),
          Radio(
            value: 1,
            groupValue: _radioGroupValue,
            onChanged: (int? index) => _radioOnChanged(index!),
          ),
          const Text('Friends'),
          Radio(
            value: 2,
            groupValue: _radioGroupValue,
            onChanged: (int? index) => _radioOnChanged(index!),
          ),
          const Text('Coffee'),
        ],
      ),
    );
  }
}
