import 'package:flutter/material.dart';

class MeasurementHistoryScreen extends StatelessWidget {
  // Exemple de données historiques
  final List<Map<String, dynamic>> history = [
    {"temperature": 25.3, "weight": 68.5, "smokeDetection": false, "time": "08:00"},
    {"temperature": 26.1, "weight": 67.8, "smokeDetection": true, "time": "10:30"},
    {"temperature": 24.8, "weight": 69.0, "smokeDetection": false, "time": "13:00"},
    {"temperature": 27.2, "weight": 68.2, "smokeDetection": false, "time": "15:45"},
    {"temperature": 25.0, "weight": 68.0, "smokeDetection": true, "time": "18:20"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Historique des Mesures",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Nombre de colonnes
            crossAxisSpacing: 10, // Espacement horizontal
            mainAxisSpacing: 10, // Espacement vertical
            childAspectRatio: 1, // Proportion (largeur/hauteur)
          ),
          itemCount: history.length,
          itemBuilder: (context, index) {
            final measurement = history[index];
            return _buildHistoryCard(measurement);
          },
        ),
      ),
    );
  }

  Widget _buildHistoryCard(Map<String, dynamic> measurement) {
    // Déterminer la couleur selon la détection de fumée
    final smokeDetected = measurement["smokeDetection"];
    final smokeColor = smokeDetected ? Colors.red : Colors.green;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heure de mesure
            Text(
              "Heure: ${measurement['time']}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8),
            // Température
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.thermostat, color: Colors.orange),
                Text(
                  "${measurement['temperature']} °C",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Poids
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.scale, color: Colors.blue),
                Text(
                  "${measurement['weight']} kg",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
            SizedBox(height: 8),
            // Détection de fumée
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.smoke_free, color: smokeColor),
                Text(
                  smokeDetected ? "Fumée détectée" : "Aucune fumée",
                  style: TextStyle(fontSize: 14, color: smokeColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
