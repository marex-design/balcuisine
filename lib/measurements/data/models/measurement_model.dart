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

    Timestamp timestamp = data['timestamp'] as Timestamp;

    return MeasurementModel(
      temperature: (data['temperature'] as num).toDouble(),
      weight: (data['weight'] as num).toDouble(),
      smokeDetection: data['smokeDetection'] as bool,
      humidity: (data['humidity'] as num).toDouble(),   
      dateTime: timestamp.toDate(),
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
