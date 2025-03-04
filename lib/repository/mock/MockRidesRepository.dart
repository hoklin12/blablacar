import 'package:week_3_blabla_project/repository/ride_repository.dart';
import 'package:week_3_blabla_project/service/rides_service.dart';
import '../../model/ride/locations.dart';
import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../model/user/user.dart';

class MockRidesRepository extends RidesRepository {
  final List<Ride> rides = [
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 5, minutes: 30)),
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 7, minutes: 30)),
      driver: User(
        firstName: 'Kannika',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: true,
      ),
      acceptPets: true,
      availableSeats: 2,
      pricePerSeat: 10.0,
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 20)),
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 22)),
      driver: User(
        firstName: 'Chaylim',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: true,
      ),
      acceptPets: true,
      availableSeats: 2,
      pricePerSeat: 10.0,
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 5)),
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
      driver: User(
        firstName: 'Mengtech',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: true,
      ),
      acceptPets: true,
      availableSeats: 1,
      pricePerSeat: 10.0,
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 5)),
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 7)),
      driver: User(
        firstName: 'Limhao',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: true,
      ),
      acceptPets: true,
      availableSeats: 2,
      pricePerSeat: 10.0,
    ),
    Ride(
      departureLocation: Location(name: 'Battambang', country: Country.cambodia),
      departureDate: DateTime.now().add(Duration(hours: 5)),
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(Duration(hours: 8)),
      driver: User(
        firstName: 'Sovanda',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: true,
      ),
      acceptPets: true,
      availableSeats: 1,
      pricePerSeat: 10.0,
    ),
  ];

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return rides.where((ride) {
      bool matchesFilter = true;

      if (filter != null) {
        if (filter.acceptPets != null) {
          matchesFilter = matchesFilter && ride.acceptPets == filter.acceptPets;
        }
      }
      return matchesFilter;
    }).toList();
  }
}