import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domain/usecases/generate_number_sequence.dart';
import 'presentation/bloc/number/number_bloc.dart';
import 'presentation/ui/number_sequence_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Number Sequence App',
      home: BlocProvider(
        create: (context) => NumberBloc(GenerateNumberSequenceUseCase()),
        child: NumberSequencePage(),
      ),
    );
  }
}
