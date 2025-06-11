import 'package:flutter/material.dart';

class MeasurementScreen extends StatelessWidget {
  final Map<String, dynamic> measurements = {
    "temperature": 25.3, // En °C
    "weight": 68.5, // En kg
    "smokeDetection": true, // true = fumée détectée
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mesures en Temps Réel",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMeasurementCard(
              icon: Icons.thermostat,
              title: "Température",
              value: "${measurements['temperature']} °C",
              color: Colors.orange,
            ),
            SizedBox(height: 16),
            _buildMeasurementCard(
              icon: Icons.scale,
              title: "Poids",
              value: "${measurements['weight']} kg",
              color: Colors.blue,
            ),
            SizedBox(height: 16),
            _buildMeasurementCard(
              icon: Icons.smoke_free,
              title: "Détection de Fumée",
              value: measurements['smokeDetection'] ? "Fumée détectée" : "Aucune fumée",
              color: measurements['smokeDetection'] ? Colors.red : Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurementCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

