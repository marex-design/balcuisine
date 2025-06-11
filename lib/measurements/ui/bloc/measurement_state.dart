import '../../domain/entities/measurement.dart';

abstract class MeasurementState {}

class MeasurementInitial extends MeasurementState {}

class MeasurementLoading extends MeasurementState {}

class MeasurementLoaded extends MeasurementState {
  final List<Measurement> measurements;

  MeasurementLoaded(this.measurements);
}

class MeasurementError extends MeasurementState {
  final String message;

  MeasurementError(this.message);
}
