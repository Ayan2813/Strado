import 'package:flutter/material.dart';

class Stop {
  final String name;
  final String arrivalTime;

  Stop({required this.name, required this.arrivalTime});
}

class RouteDetailsScreen extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      appBar: AppBar(
        backgroundColor: const Color(0xFF203A43),
        title: Text(routeName),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bus Status
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.check_circle, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      "Bus Status: On Time",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Text(
                "Upcoming Stops",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Stops List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: stops.length,
                itemBuilder: (context, index) {
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              stops[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Arrival Time: ${stops[index].arrivalTime}",
                              style: const TextStyle(color: Colors.white60),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              // Driver Details Card
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
                          driverImagePath ?? 'assets/driver_image.jpg',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Name: $driverName",
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Contact: $driverContact",
                        style: const TextStyle(color: Colors.white60),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Live Location placeholder
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF203A43),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Live Location of Bus (map or tracker here)",
                    style: TextStyle(color: Colors.white60),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

