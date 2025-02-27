import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/ride_pref/widgets/ride_pref_tile.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/widgets/Display/bla_divider.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../service/ride_prefs_service.dart';
import '../../../utils/animations_util.dart';
import '../../../widgets/actions/bla_button.dart';
import '../../../widgets/inputs/bla_location_picker.dart';
import '../ride_pref_screen.dart';

///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;



  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    // set default values
    departure = widget.initRidePref?.departure;
    arrival = widget.initRidePref?.arrival;
    departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
    requestedSeats = widget.initRidePref?.requestedSeats ?? 1;

  }

  // ----------------------------------
  // Handle events
  // ----------------------------------
  void onRidePrefSelected(RidePref? currentRidePref) {
    Navigator.push(
      context,
      AnimationUtils.createBottomToTopRoute(BlaLocationPickerModal()), // This is the modal or screen to navigate to
    );
  }
  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(BlaSpacings.m),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RidePrefTile(title: "leaving from",
              leadingIcon: Icons.circle_outlined,
              onTap: (){
              onRidePrefSelected(RidePrefService.currentRidePref);
            }, trailingIcon: Icons.swap_vert, onRightTap: (){},
            ),
            BlaDivider(),
            RidePrefTile(title: "going on",
              leadingIcon: Icons.circle_outlined,
              onTap: (){
              onRidePrefSelected(RidePrefService.currentRidePref);

            },),
            BlaDivider(),
            RidePrefTile(title: "today",
              leadingIcon: Icons.calendar_month,
              onTap: (){},),
            BlaDivider(),
            RidePrefTile(title: "1",
              leadingIcon: Icons.person,
              onTap: (){},),
            BlaButton(
              label: 'Search',
              style: BlaButtonStyle.primary,
              icon: Icons.search,
              onPressed: (){
                onRidePrefSelected(RidePrefService.currentRidePref);

              },
            ),

          ]),
    );
  }


}
