import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/measurement.dart';
import '../../domain/repositories/measurement_repository.dart';
import '../models/measurement_model.dart';

class MeasurementRepositoryImpl implements MeasurementRepository {
  final FirebaseFirestore firestore;

  MeasurementRepositoryImpl(this.firestore);

  @override
  Stream<List<Measurement>> getMeasurements() {
    return firestore
        .collection('measurements')
        .orderBy('dateTime', descending: true)
        .snapshots()
        .map((snapshot) {
      final list = snapshot.docs
          .map((doc) => MeasurementModel.fromFirestore(doc))
          .toList();
      print("Mesures récupérées !!!!! ${list.length}");
      return list;
    });
  }
}
