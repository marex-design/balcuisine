import 'package:balcuisine/auth/data/auth_repository_impl.dart';
import 'package:balcuisine/auth/domain/usecases/sign_in_usecase.dart';
import 'package:balcuisine/auth/ui/bloc/auth_bloc.dart';
import 'package:balcuisine/measurements/data/repositories/measurement_repository_impl.dart';
import 'package:balcuisine/measurements/domain/repositories/measurement_repository.dart';
import 'package:balcuisine/measurements/ui/bloc/measurement_bloc.dart';
import 'package:balcuisine/measurements/ui/bloc/measurement_event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/date_symbol_data_local.dart';
 
import 'measurements/ui/bloc/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initializeDateFormatting('fr_FR', null);

  final firebaseAuth = FirebaseAuth.instance;

  final authRepository = AuthRepositoryImpl(firebaseAuth);
  final signInUseCase = SignInUseCase(authRepository);
  final firestore = FirebaseFirestore.instance;

  final measurementRepository = MeasurementRepositoryImpl(firestore);
  //FirebaseFirestore.instance.collection('measurements').add({
    //'temperature': 24.5,
    //'humidity': 65.0,
    //'weight': 3.2,
    //'smokeDetection': false,
    //'dateTime': Timestamp.now(),
  //}).then((_) {
    //print(" Mesure de test ajoutée");
  //}).catchError((error) {
    //print(" Erreur : $error");
  //});
 

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepositoryImpl>.value(value: authRepository),
        RepositoryProvider<MeasurementRepository>.value(
            value: measurementRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(signInUseCase),
          ),
          BlocProvider(
              create: (_) => MeasurementBloc(measurementRepository)
                ..add(LoadMeasurements())),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balcuisine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
