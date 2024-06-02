import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:number_sequence/domain/usecases/generate_number_sequence.dart';
import 'package:number_sequence/presentation/bloc/number/number_event.dart';
import 'package:number_sequence/presentation/bloc/number/number_state.dart';

class NumberBloc extends Bloc<NumberEvent, NumberState> {
  final GenerateNumberSequenceUseCase generateNumberSequenceUseCase;

  NumberBloc(this.generateNumberSequenceUseCase) : super(NumberInitial()) {
    on<GenerateNumberSequence>(_onGenerateNumberSequence);
  }

  void _onGenerateNumberSequence(
      GenerateNumberSequence event, Emitter<NumberState> emit) {
    final sequence = generateNumberSequenceUseCase(event.n, event.type);
    emit(NumberGenerated(sequence, event.type));
  }
}
