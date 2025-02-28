import 'package:flutter/material.dart';
import '../../dummy_data/dummy_data.dart';
import '../../model/ride/locations.dart';
import 'bla_text_field.dart';

class FullScreenInputLocation extends StatefulWidget {
  const FullScreenInputLocation({super.key});

  @override
  _FullScreenInputLocationState createState() => _FullScreenInputLocationState();
}

class _FullScreenInputLocationState extends State<FullScreenInputLocation> {
  final TextEditingController controller = TextEditingController();
  List<Location> filteredLocations = fakeLocations; // Start with all locations

  @override
  void initState() {
    super.initState();
    controller.addListener(_filterLocations);
  }

  void _filterLocations() {
    final query = controller.text.toLowerCase();
    setState(() {
      filteredLocations = fakeLocations
          .where((location) => location.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Station Road or the Bridge Cafe',
              prefixIcon: Icons.arrow_back_ios_new_outlined,
              suffixIcon: Icons.clear,
              controller: controller,
              onSuffixTap: () {
                controller.clear();
              },
              onPrefixTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 16), // Space between the text field and suggestions
            Expanded(
              child: ListView.builder(
                itemCount: filteredLocations.length,
                itemBuilder: (context, index) {
                  final location = filteredLocations[index];
                  return ListTile(
                    title: Text(location.name),
                    subtitle: Text(location.country.name), // Adjust this based on your Country model
                    onTap: () {
                      // Handle selection
                      print('Selected: ${location.name}');
                      // You can also close the modal or navigate to another screen
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}