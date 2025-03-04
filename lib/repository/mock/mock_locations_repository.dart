
import '../../model/ride/locations.dart';
import '../locations_repository.dart';


///
///
///
class  MockLocationsRepository extends LocationsRepository{

  final Location phnomPenh = Location(name: "PhnomPenh", country: Country.cambodia);
  final Location siemReap = Location(name: "SiemReap", country: Country.cambodia);
  final Location battambang = Location(name: "Battambang", country: Country.cambodia);
  final Location sihanoukville = Location(name: "Sihanoukville", country: Country.cambodia);
  final Location kampot = Location(name: "Kampot", country: Country.cambodia);


  @override
  List<Location> getLocations() {
    return [phnomPenh, siemReap, battambang, sihanoukville, kampot];
  }
}