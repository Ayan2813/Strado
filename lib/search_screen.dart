import 'package:flutter/material.dart';
import 'route_details_screen.dart';
import 'strado/models/stop_model.dart';
 // assuming you have a Stop model defined somewhere

class SearchScreen extends StatefulWidget {
  final List<Map<String, dynamic>> allRoutes;

  const SearchScreen({super.key, required this.allRoutes});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  List<Map<String, dynamic>> results = [];

  void updateSearch(String input) {
    setState(() {
      query = input;
      results = widget.allRoutes.where((route) {
        return (route['stops'] as List)
            .any((stop) => stop['name'].toString().toLowerCase().contains(input.toLowerCase()));
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F2027),
        iconTheme: const IconThemeData(color: Colors.white),
        title: TextField(
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Search stop name...',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          onChanged: updateSearch,
        ),
      ),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (_, index) {
          final route = results[index];
          final List<Stop> stopsList = (route["stops"] as List)
              .map((s) => Stop(name: s["name"], arrivalTime: s["arrival"]))
              .toList();
          return ListTile(
            title: Text(route["name"], style: const TextStyle(color: Colors.white)),
            subtitle: Text("From ${route['from']} to ${route['to']}", style: const TextStyle(color: Colors.white54)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RouteDetailsScreen(
                    routeName: route["name"],
                    stops: stopsList,
                    driverName: route["driver"]["name"],
                    driverContact: route["driver"]["contact"],
                    driverImagePath: route["image"],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
