import 'package:flutter/material.dart';
import '../../dummy_data/dummy_data.dart';
import '../../model/ride/ride.dart';

class RidesScreen extends StatelessWidget {
  const RidesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Using the fakeRides from dummy_data.dart
    final List<Ride> rides = fakeRides;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: rides.length,
        itemBuilder: (context, index) {
          final ride = rides[index];
          return Card(
            margin: const EdgeInsets.all(5),
            child: ListTile(
              title: Text(
                "Departure: ${ride.departureLocation.name}\n${ride.arrivalLocation.name}",
              ),
              subtitle: Text(
                "Time: ${ride.departureDate.hour}:${ride.departureDate.minute} | Seats: ${ride.availableSeats} | Price: €${ride.pricePerSeat}",
              ),
              onTap: () {
                // Handle tap event
              },
            ),
          );
        },
      ),
    );
  }
}
