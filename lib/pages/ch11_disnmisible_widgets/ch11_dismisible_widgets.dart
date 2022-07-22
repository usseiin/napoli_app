import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:napoli_app/models/trip.dart';

class Ch11DismissibleWidget extends StatefulWidget {
  const Ch11DismissibleWidget({Key? key}) : super(key: key);
  static const String nameRoute = '/ch11_dismissible';

  @override
  State<Ch11DismissibleWidget> createState() => _Ch11DismissibleWidgetState();
}

class _Ch11DismissibleWidgetState extends State<Ch11DismissibleWidget> {
  final List _trips = <Trip>[];
  @override
  void initState() {
    super.initState();
    _trips
      ..add(Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'))
      ..add(Trip(id: '1', tripName: 'Paris', tripLocation: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cancun', tripLocation: 'Mexico'))
      ..add(Trip(id: '4', tripName: 'London', tripLocation: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'))
      ..add(Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'));
  }

  _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Icon(
              Icons.done,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  _buildRemoveTrip() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  void _markTripCompleted() {
    // Mark trip completed in Database or web service
    log("trip complete");
  }

  void _deleteTrip() {
    // Delete trip from Database or web service
    log("delete trip");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dismissible"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _trips.length,
          itemBuilder: (context, index) {
            return Dismissible(
              background: _buildCompleteTrip(),
              secondaryBackground: _buildRemoveTrip(),
              onDismissed: (direction) {
                if (direction == DismissDirection.startToEnd) {
                  _markTripCompleted();
                } else {
                  _deleteTrip();
                }
                setState(() {
                  _trips.removeAt(index);
                });
              },
              key: Key(_trips[index].id),
              child: ListTile(
                title: Text(_trips[index].tripName),
                subtitle: Text(_trips[index].tripLocation),
                leading: const Icon(Icons.flight),
                trailing: const Icon(Icons.fastfood),
              ),
            );
          },
        ),
      ),
    );
  }
}
