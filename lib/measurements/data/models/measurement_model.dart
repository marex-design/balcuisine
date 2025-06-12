import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/measurement.dart';

class MeasurementModel extends Measurement {
  MeasurementModel({
    required double temperature,
    required double weight,
    required bool smokeDetection,
    required double humidity,
    required DateTime dateTime,
  }) : super(
          temperature: temperature,
          weight: weight,
          smokeDetection: smokeDetection,
          humidity: humidity,
          dateTime: dateTime,
        );

  // Conversion Firestore -> MeasurementModel
  factory MeasurementModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;

    print("📄 Document reçu : $data"); // Ajoute ceci pour debug

    return MeasurementModel(
      temperature: data['temperature']?.toDouble() ?? 0.0,
      humidity: data['humidity']?.toDouble() ?? 0.0,
      weight: data['weight']?.toDouble() ?? 0.0,
      smokeDetection: data['smokeDetection'] ?? false,
      dateTime: (data['dateTime'] as Timestamp).toDate(),
    );
  }

  // Conversion MeasurementModel -> Map Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'temperature': temperature,
      'weight': weight,
      'smokeDetection': smokeDetection,
      'humidity': humidity,
      'timestamp': Timestamp.fromDate(dateTime),
    };
  }
}
