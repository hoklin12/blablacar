// import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
//
// import '../dummy_data/dummy_data.dart';
// import '../model/ride/ride.dart';
// import '../repository/ride_repository.dart';
//
// ////
// ///   This service handles:
// ///   - The list of available rides
// ///
// class RidesService {
//
//   // static List<Ride> availableRides = fakeRides;
//   //
//   //
//   // ///
//   // ///  Return the relevant rides, given the passenger preferences
//   // ///
//   // static List<Ride> getRidesFor(RidePreference preferences) {
//   //
//   //   // For now, just a test
//   //   return availableRides.where( (ride) => ride.departureLocation == preferences.departure && ride.arrivalLocation == preferences.arrival).toList();
//   // }
//
//   //
//   static RidesService? _instance;
//
//   final RidesRepository repository;
//
//   RidesService._internal(this.repository){}
//
//   List<Ride> getLocations() {
//     return repository.getRides(preference, filter);
//   }
//
//   static void initialize(RidesRepository repository) {
//     if (_instance == null) {
//       _instance = RidesService._internal(repository);
//     }
//   }
//
//   static RidesService get instance {
//     if (_instance == null) {
//       throw Exception("You should initialize your service first. Please call the initialize");
//     }
//     return _instance!;
//   }
//
//
// }
//



import '../model/ride/ride.dart';
import '../model/ride_pref/ride_pref.dart';
import '../repository/ride_repository.dart';


////
///   This service handles:
///   - The list of available rides
///
///
class RidesService {

    // static List<Ride> availableRides = fakeRides;

    ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  // static List<Ride> getRidesFor(RidePreference preferences) {
  //
  //   // For now, just a test
  //   return availableRides.where( (ride) => ride.departureLocation == preferences.departure && ride.arrivalLocation == preferences.arrival).toList();

  static RidesService? _instance;
  late final RidesRepository repository;

  RidesService._internal(this.repository);

  /// **Initializer method to set up the repository**
  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    }
  }

  /// Singleton Instance Getter
  static RidesService get instance {
    if (_instance == null) {
      throw Exception("RidesService is not initialized. Call initialize(repository) first.");
    }
    return _instance!;
  }

  /// Service API for retrieving rides based on preference & filter
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return repository.getRides(preference, filter);
  }
}

class RidesFilter {
  final bool acceptPets;

  RidesFilter(this.acceptPets);

}