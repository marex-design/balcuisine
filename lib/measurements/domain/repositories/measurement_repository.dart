import '../entities/measurement.dart';

abstract class MeasurementRepository {
  // Retourne un Stream de liste de mesures (triées par date décroissante)
  Stream<List<Measurement>> getMeasurements();
}
