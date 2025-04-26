import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      appBar: AppBar(
        backgroundColor: const Color(0xFF203A43),
        title: const Text("Support", style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "How can we help you?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "If you’re experiencing any issues or have questions, feel free to browse our FAQs or reach out to us directly.",
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 24),
            _buildFAQTile(
              question: "How do I track my bus?",
              answer:
              "Go to the Home screen, scroll to your route and tap to see real-time stop updates.",
            ),
            _buildFAQTile(
              question: "What if my bus is delayed?",
              answer:
              "Delays will be reflected in the stop arrival times. Check the Route Details screen for updates.",
            ),
            _buildFAQTile(
              question: "How do I contact the driver?",
              answer:
              "Driver contact info is available at the bottom of each Route Details screen.",
            ),
            _buildFAQTile(
              question: "Is there an emergency contact?",
              answer:
              "Yes, each driver’s profile includes an emergency contact number you can call immediately.",
            ),
            const SizedBox(height: 24),
            const Text(
              "Still need help?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            _buildContactOption(
              icon: Icons.email,
              label: "Email us",
              detail: "support@strado.app",
            ),
            _buildContactOption(
              icon: Icons.phone,
              label: "Call us",
              detail: "+91 98765 43210",
            ),
            _buildContactOption(
              icon: Icons.help_outline,
              label: "Visit Help Center",
              detail: "www.strado.app/help",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQTile({required String question, required String answer}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF203A43),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        collapsedIconColor: Colors.white70,
        iconColor: Colors.white,
        title: Text(
          question,
          style: const TextStyle(color: Colors.white),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              answer,
              style: const TextStyle(color: Colors.white70),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String label,
    required String detail,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF203A43),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 4),
              Text(detail,
                  style: const TextStyle(color: Colors.white70, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
