import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'route_details_screen.dart';
import 'search_screen.dart';
import 'support.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _scrolled = false;

  final List<Map<String, dynamic>> routes = [
    {
      "name": "JBS Route",
      "from": "Jbs",
      "to": "Kmce",
      "time": "90 mins",
      "stops": [
        {"name": "JBS", "arrival": "7:25 AM"},
        {"name": "Paradise", "arrival": "7:30 AM"},
        {"name": "Chilkalguda", "arrival": "7:33 AM"},
        {"name": "Gandhi Hospital", "arrival": "7:36 AM"},
        {"name": "Musheerabad", "arrival": "7:40 AM"},
        {"name": "RTC Cross Roads", "arrival": "7:45 AM"},
        {"name": "Ramnagar", "arrival": "7:50 AM"},
        {"name": "Shivam Road", "arrival": "7:55 AM"},
        {"name": "6 no", "arrival": "8:00 AM"},
        {"name": "Amberpet", "arrival": "8:05 AM"},
        {"name": "KMCE", "arrival": "9:10 AM"},
      ],
      "driver": {"name": "Thirumalesh", "contact": "987-654-3210" , "Emergency No": "987-654-3210"},
    },
    {
      "name": "JNTU Route",
      "from": "Jntu",
      "to": "Kmce",
      "time": "110 mins",
      "stops": [
        {"name": "JNTU Signal", "arrival": "7:22 AM"},
        {"name": "KPHB Metro Stn", "arrival": "7:23 AM"},
        {"name": "Kukatpally", "arrival": "7:26 AM"},
        {"name": "Balnagar y Junction", "arrival": "7:28 AM"},
        {"name": "Bharath Nagar", "arrival": "7:30 AM"},
        {"name": "Erragadda", "arrival": "7:32 AM"},
        {"name": "S R Nagar", "arrival": "7:35 AM"},
        {"name": "Ameerpet Maithrivanam", "arrival": "7:37 AM"},
        {"name": "Panjagutta", "arrival": "7:39 AM"},
        {"name": "Khairathabad", "arrival": "7:44 AM"},
        {"name": "Lakdikaphool", "arrival" : "7:46 AM"},
        {"name": "Abids Charmas", "arrival": "7:51 AM"},
        {"name": "Koti ","arrival": "7:54 AM"},
        {"name": "Chadarghat", "arrival": "7:56 AM"},
        {"name": "Malakpet", "arrival": "7:58 AM"},
        {"name": "TV Tower", "arrival": "8:002 AM"},
        {"name": "Dilsuknagarl", "arrival": "8:03 AM"},
        {"name": "Chaithanyapuri", "arrival": "8:05AM"},
        {"name": "Kothapet", "arrival": "8:06 AM"},
        {"name": "KMCE", "arrival":"9:10AM"},

      ],
      "driver": {"name": "Anjali Rao", "contact": "912-345-6789" ,"Emergency No": "987-654-3210"},
    },
    {
      "name": "OldCity Route",
      "from": "Chatrinaka",
      "to": "Kmce",
      "time": "75 mins",
      "stops": [
        {"name": "Chatrinaka (old city)", "arrival": "7:45 AM"},
        {"name": "ChandrayanGutta", "arrival": "7:55 AM"},
        {"name": "Midhani", "arrival": "8:05 AM"},
        {"name": "TKR Kaman", "arrival": "8:35AM"},
        {"name": "Sagar Ring Road", "arrival": "8:38 AM"},
        {"name": "Hasthinapuram", "arrival": "8:40 AM"},
        {"name": "B N Reddy", "arrival": "8:45 AM"},
        {"name": "Yamjal", "arrival": "8:55 AM"},
        {"name": "KMCE", "arrival": "9:05 AM"},

      ],
      "driver": {"name": "Imran Sheikh", "contact": "998-877-6655","Emergency No": "987-654-3210"},
    },
    {
      "name": "Ecil Route",
      "from": "Ecil",
      "to": "Kmce",
      "time": "105 mins",
      "stops": [
    {"name": "ECIL", "arrival": "7:15AM"},
    {"name": "A S Rao Nagar", "arrival": "7:17AM"},
    {"name": "Neredmet", "arrival": "7:25 AM"},
    {"name": "VinayakNagar", "arrival": "7:35 AM"},
    {"name": "Anandbagh", "arrival": "7:40AM"},
    {"name": "Z T C Moulali", "arrival": "7:37 AM"},
    {"name": "H B Colony", "arrival": "7:40 AM"},
    {"name": "Noma Function Hall", "arrival": "7:50 AM"},
    {"name": "Nacharam", "arrival": "7:53 AM"},
    {"name": "Vaijayanthi", "arrival": "7:55AM"},
    {"name": "H M T Sparl", "arrival": "7:57AM"},
    {"name": "Habsiguda", "arrival": "8:02AM"},
    {"name": "NGRI ", "arrival": "8:05 AM"},
    {"name": "Uppal", "arrival": "8:07AM"},
    {"name": "Nagole", "arrival": "8:10 AM"},
    {"name": "Alkapuri", "arrival": "8:20 AM"},
    {"name": "LB Nagar", "arrival": "8:23 AM"},
    {"name": "B N Reddy", "arrival": "8:38AM"},
    {"name": "KMCE", "arrival": "9:05 AM"},

    ],
      "driver": {"name": "Sita Devi", "contact": "900-123-4567","Emergency No": "987-654-3210"},
    },
    {
      "name": "Saidabad Route",
      "from": "Saidabad",
      "to": "Kmce",
      "time": "80 mins",
      "stops": [
{"name": "Saidabad", "arrival": "7:45AM"},
{"name": "Saroornagar", "arrival": "7:50AM"},
{"name": "Karmanghat", "arrival": "7:55 AM"},
{"name": "Bairamalguda", "arrival": "7:58 AM"},
{"name": "Sagar Ring Road", "arrival": "8:00AM"},
{"name": "Chinthalkunta", "arrival": "8:05 AM"},
{"name": "Panama", "arrival": "8:09 AM"},
{"name": "Sushma", "arrival": "8:10 AM"},
{"name": "Autonagar", "arrival": "8:12AM"},
{"name": "Hayathnagar", "arrival": "8:15AM"},
{"name": "Pedda amberpet", "arrival": "8:12AM"},
{"name": "Koheda Road", "arrival": "8:32AM"},
{"name": "KMCE ", "arrival": "9:05 AM"},

],
      "driver": {"name": "Rahul Singh", "contact": "811-222-3333","Emergency No": "987-654-3210"},
    },
    {
      "name": "Ramanthapur Route",
      "from": "Ali Cafe",
      "to": "Kmce",
      "time": "80 mins",
      "stops": [
{"name": "Alicafe", "arrival": "8:00AM"},
{"name": "T.V Studio", "arrival": "8:02AM"},
{"name": "Ramanthapur", "arrival": "8:05AM"},
{"name": "Uppal x Road", "arrival": "8:07 AM"},
{"name": "Mohan Nagar", "arrival": "8:15AM"},
{"name": "Kothapet", "arrival": "8:20 AM"},
{"name": "LB Nagar", "arrival": "8:30 AM"},
{"name": "Sagar Complex", "arrival": "8:55 AM"},
{"name": "KMCE", "arrival": "9:05AM"},

],
      "driver": {"name": "Divya Narayan", "contact": "700-444-5555","Emergency No": "987-654-3210"},
    },
  ];


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 100 && !_scrolled) {
      setState(() {
        _scrolled = true;
      });
    } else if (_scrollController.offset <= 100 && _scrolled) {
      setState(() {
        _scrolled = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Full screen Welcome section
                  Container(
                    height: size.height,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/background.jpeg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: AnimatedOpacity(
                      opacity: _scrolled ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 600),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Welcome!",
                                style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                "Your college commute made easier.\nTrack, plan, and ride with confidence.",
                                style: TextStyle(color: Colors.white60, fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // App Bar Section
                  Container(
                    color: const Color(0xFF0F2027),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.directions_bus, color: Colors.white, size: 28),
                            SizedBox(width: 10),
                            Text(
                              "STRADO",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ProfileScreen(
                                  name: "Ayan Choudhary",
                                  phoneNumber: "9490685152",
                                  email: "ayyanschoudhary9@.com",
                                ),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.person, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Routes List
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                    child: Column(
                      children: List.generate(routes.length, (index) {
                        final route = routes[index];
                        return GestureDetector(
                          onTap: () {
                            final List<Stop> stopsList = (route["stops"] as List)
                                .map((s) => Stop(
                              name: s["name"] ?? "Unnamed",
                              arrivalTime: s["arrival"] ?? "Unknown",
                            ))
                                .toList();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RouteDetailsScreen(
                                  routeName: route["name"] ?? "Unnamed Route",
                                  stops: stopsList,
                                  driverName: route["driver"]["name"] ?? "Unknown Driver",
                                  driverContact: route["driver"]["contact"] ?? "N/A",
                                  driverImagePath: route["image"],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 12.0),
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: const Color(0xFF203A43),
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white24,
                                  blurRadius: 6.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  route["name"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "From: ${route["from"]} → To: ${route["to"]}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Estimated Time: ${route["time"]}",
                                  style: const TextStyle(color: Colors.white60),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF203A43),
        unselectedItemColor: Colors.black45,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SupportScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SearchScreen(allRoutes: routes)),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Support"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ),
    );
  }
}