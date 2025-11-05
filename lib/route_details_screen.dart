import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Stop {
  final String name;
  final String arrivalTime;
  Stop({required this.name, required this.arrivalTime});
}

class RouteDetailsScreen extends StatefulWidget {
  final String routeName;
  final List<Stop> stops;
  final String driverName;
  final String driverContact;
  final String? driverImagePath;

  const RouteDetailsScreen({
    super.key,
    required this.routeName,
    required this.stops,
    required this.driverName,
    required this.driverContact,
    this.driverImagePath,
  });

  @override
  _RouteDetailsScreenState createState() => _RouteDetailsScreenState();
}

class _RouteDetailsScreenState extends State<RouteDetailsScreen> {
  late GoogleMapController mapController;
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(17.385044, 78.486671),
    zoom: 14.0,
  );

  int currentStopIndex = 0;
  late LatLng busPosition;
  String busStatus = "On Time";
  Color busStatusColor = Colors.green[700]!;
  String lastUpdated = "";

  final List<LatLng> mockPath = [
    LatLng(17.385044, 78.486671),
    LatLng(17.3875, 78.4880),
    LatLng(17.3900, 78.4895),
    LatLng(17.3925, 78.4910),
    LatLng(17.3950, 78.4925),
  ];

  int pathIndex = 0;
  Timer? movementTimer;

  @override
  void initState() {
    super.initState();
    busPosition = mockPath[0];
    startMockMovement();
  }

  void startMockMovement() {
    movementTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        pathIndex = (pathIndex + 1) % mockPath.length;
        busPosition = mockPath[pathIndex];

        // Simulate stop changes
        if (pathIndex % 2 == 0 && currentStopIndex < widget.stops.length - 1) {
          currentStopIndex++;
        }

        // Always "On Time" at last stop
        if (currentStopIndex == widget.stops.length - 1) {
          busStatus = "On Time";
          busStatusColor = Colors.green[700]!;
        } else {
          // Normal simulated status changes
          if (pathIndex % 4 == 0) {
            busStatus = "On Time";
            busStatusColor = Colors.green[700]!;
          } else if (pathIndex % 4 == 1) {
            busStatus = "Slight Delay";
            busStatusColor = Colors.orange[700]!;
          } else {
            busStatus = "Late";
            busStatusColor = Colors.red[700]!;
          }
        }

        // Update last updated time
        lastUpdated = "Last updated: ${TimeOfDay.now().format(context)}";
      });
    });
  }

  @override
  void dispose() {
    movementTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      appBar: AppBar(
        backgroundColor: const Color(0xFF203A43),
        title: Text(widget.routeName),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bus Status Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: busStatusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.directions_bus, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      "Bus Status: $busStatus",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              if (lastUpdated.isNotEmpty)
                Text(
                  lastUpdated,
                  style: const TextStyle(color: Colors.white54, fontSize: 12),
                ),

              const SizedBox(height: 16),

              // Upcoming Stops
              const Text(
                "Upcoming Stops",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: widget.stops.asMap().entries.map((entry) {
                  int index = entry.key;
                  Stop stop = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: [
                            if (index == currentStopIndex)
                              const Icon(Icons.directions_bus,
                                  color: Colors.yellow, size: 18),
                            const SizedBox(width: 4),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(stop.name,
                                    style:
                                    const TextStyle(color: Colors.white)),
                                Text(
                                  "Arrival Time: ${stop.arrivalTime}",
                                  style: const TextStyle(color: Colors.white60),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 24),

              // Driver Details
              Card(
                color: const Color(0xFF203A43),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.person, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Driver Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                          widget.driverImagePath ?? 'assets/driver_image.jpg',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Name: ${widget.driverName}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Contact: ${widget.driverContact}",
                        style: const TextStyle(color: Colors.white60),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Live Map
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF203A43),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: GoogleMap(
                  initialCameraPosition: _initialPosition,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId("bus_marker"),
                      position: busPosition,
                      infoWindow: const InfoWindow(title: "Bus Location"),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueAzure),
                    ),
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: true,
                  zoomControlsEnabled: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
