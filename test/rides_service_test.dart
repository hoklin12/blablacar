import 'package:flutter_test/flutter_test.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/repository/mock/MockRidesRepository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';

void main() {
  group('RidesService Tests', () {
    late RidesService ridesService;

    setUp(() {
      // Initialize the RidesService with the MockRidesRepository
      RidesService.initialize(MockRidesRepository());
      ridesService = RidesService.instance; // Get the initialized instance
    });

    test('T1: Ride Preference from Battambang to Siem Reap with 1 passenger', () {
      final now = DateTime.now(); // Get the current date and time
      final preference = RidePreference(
        departure: Location(name: 'Battambang', country: Country.cambodia),
        departureDate: DateTime(now.year, now.month, 0, 0), // Last day of the previous month at midnight
        arrival: Location(name: 'SiemReap', country: Country.cambodia),
        requestedSeats: 1,
      );

      final filter = RidesFilter(null); // Default filter, acceptPets is null

      final repository = MockRidesRepository();
      final rides = repository.getRides(preference, filter);

      rides.sort((a, b) => a.departureDate.compareTo(b.departureDate));

      // Print formatted output
      print('For your preference (Battambang -> SiemReap, today 1 passenger) we found ${rides.length} rides:');
      for (var ride in rides) {
        final departureTime = ride.departureDate;
        final duration = ride.arrivalDateTime.difference(departureTime);
        final formattedDuration = duration.inHours == 0
            ? '${duration.inMinutes} minutes'
            : '${duration.inHours} hours';
        final formattedTime = '${departureTime.hour}:${departureTime.minute.toString().padLeft(2, '0')} ${departureTime.hour < 12 ? 'am' : 'pm'}';

        print('- at $formattedTime\twith ${ride.driver.firstName} ($formattedDuration)');
      }

      // Check that only the rides that match are returned
      print('Matched rides: ${rides.length}');

      expect(rides.length, greaterThan(0)); // Ensure at least one ride is returned
    });

    test('T2: Ride Preference from Battambang to Siem Reap with 1 passenger and pet allowed', () {
      final now = DateTime.now(); // Get the current date and time
      final preference = RidePreference(
        departure: Location(name: 'Battambang', country: Country.cambodia),
        departureDate: DateTime(now.year, now.month, 0, 0), // Last day of the previous month at midnight
        arrival: Location(name: 'SiemReap', country: Country.cambodia),
        requestedSeats: 1,
      );

      final filter = RidesFilter(true); // Make sure to match the filter too

      final repository = MockRidesRepository();
      final rides = repository.getRides(preference, filter);

      rides.sort((a, b) => a.departureDate.compareTo(b.departureDate));

      // Print formatted output
      print('For your preference (Battambang -> SiemReap, today 1 passenger and pet allowed) we found ${rides.length} rides:');
      for (var ride in rides) {
        final departureTime = ride.departureDate;
        final duration = ride.arrivalDateTime.difference(departureTime);
        final formattedDuration = duration.inHours == 0
            ? '${duration.inMinutes} minutes'
            : '${duration.inHours} hours';
        final formattedTime = '${departureTime.hour}:${departureTime.minute.toString().padLeft(2, '0')} ${departureTime.hour < 12 ? 'am' : 'pm'}';

        print('- at $formattedTime\twith ${ride.driver.firstName} ($formattedDuration)');
      }

      // Check that only the rides that match are returned
      print('Matched rides: ${rides.length}');

      expect(rides.length, greaterThan(0)); // Ensure at least one ride is returned
    });

  });
}