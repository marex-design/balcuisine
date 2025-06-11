import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/measurement.dart';
import '../../domain/repositories/measurement_repository.dart';
import '../models/measurement_model.dart';

class MeasurementRepositoryImpl implements MeasurementRepository {
  final FirebaseFirestore firestore;

  MeasurementRepositoryImpl(this.firestore);

  @override
  Stream<List<Measurement>> getMeasurements() {
    // Collection "measurements", tri par timestamp descendant
    return firestore
        .collection('measurements')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MeasurementModel.fromFirestore(doc))
            .toList());
  }
}
