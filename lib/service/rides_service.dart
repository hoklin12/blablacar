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

  // Private constructor
  RidesService._();

  static final RidesService _instance = RidesService._();

  static RidesService get instance => _instance;

  // Repository used by the service
  late RidesRepository _repository;

  // Initializer method to set the repository
  static void initialize(RidesRepository repository) {
    instance._repository = repository;
  }

  // API to get rides
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _repository.getRides(preference, filter);
  }
}

class RidesFilter {
  final bool? acceptPets;

  RidesFilter(this.acceptPets);

}