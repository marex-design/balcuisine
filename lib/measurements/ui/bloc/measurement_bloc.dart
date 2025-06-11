import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/measurement.dart';
import '../../domain/repositories/measurement_repository.dart';
import 'measurement_event.dart';
import 'measurement_state.dart';

class MeasurementBloc extends Bloc<MeasurementEvent, MeasurementState> {
  final MeasurementRepository measurementRepository;

  MeasurementBloc(this.measurementRepository) : super(MeasurementInitial()) {
    on<LoadMeasurements>((event, emit) async {
      emit(MeasurementLoading());
      try {
        await emit.forEach<List<Measurement>>(
          measurementRepository.getMeasurements(),
          onData: (measurements) => MeasurementLoaded(measurements),
          onError: (_, __) => MeasurementError("Erreur lors du chargement des mesures"),
        );
      } catch (e) {
        emit(MeasurementError(e.toString()));
      }
    });
  }
}
