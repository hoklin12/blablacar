import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/repository/ride_preferences_repository.dart';
import 'package:week_3_blabla_project/screens/rides/widgets/ride_pref_bar.dart';
import 'package:week_3_blabla_project/screens/rides/widgets/ride_pref_modal.dart';

import '../../dummy_data/dummy_data.dart';
import '../../model/ride/ride.dart';
import '../../model/ride_pref/ride_pref.dart';
import '../../repository/mock/mock_ride_preferences_repository.dart';
import '../../service/ride_prefs_service.dart';
import '../../service/rides_service.dart';
import '../../theme/theme.dart';

import '../../utils/animations_util.dart';
import 'widgets/rides_tile.dart';

///
///  The Ride Selection screen allow user to select a ride, once ride preferences have been defined.
///  The screen also allow user to re-define the ride preferences and to activate some filters.
///
class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {


  // RidePreference currentPreference  = fakeRidePrefs[0];
  RidePreference? currentPreference = RidePrefService.instance.currentPreference; // TODO 1 :  We should get it from the service

  RidesFilter? currentFilter;
  // List<Ride> get matchingRides => RidesService.instance.getRidesFor(currentPreference);
  List<Ride> get matchingRides => RidesService.instance.getRides(currentPreference!, currentFilter);


  void onBackPressed() {
    Navigator.of(context).pop();
  }

  void onPreferencePressed() async {
    // TODO  6 : we should push the modal with the current pref

    final newPreference = await Navigator.of(context).push(
      AnimationUtils.createTopSheetRoute<RidePreference>(
        RidePrefModal(currentPreference: currentPreference),
        maxHeightFactor: 0.5, // Set the height factor to control the modal height (50% of screen height)
      ),
    );
      // TODO 9 :  After pop, we should get the new current pref from the modal
    // Check if the new preference is valid
    if (newPreference != null) {
      // TODO 10 :  Then we should update the service current pref,   and update the view
      // Update the current preference in the service
      RidePrefService.instance.setCurrentPreference(newPreference);
      // Trigger a UI update by calling setState
      setState(() {
        currentPreference = newPreference;
      });
    }
  }


  void onFilterPressed() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(
          left: BlaSpacings.m, right: BlaSpacings.m, top: BlaSpacings.s),
      child: Column(
        children: [
          // Top search Search bar
          RidePrefBar(
              ridePreference: currentPreference!,
              onBackPressed: onBackPressed,
              onPreferencePressed: onPreferencePressed,
              onFilterPressed: onFilterPressed),

          Expanded(
            child: ListView.builder(
              itemCount: matchingRides.length,
              itemBuilder: (ctx, index) => RideTile(
                ride: matchingRides[index],
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
