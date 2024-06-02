import 'package:equatable/equatable.dart';

abstract class NumberEvent extends Equatable {
  const NumberEvent();
}

class GenerateNumberSequence extends NumberEvent {
  final int n;
  final int type;

  const GenerateNumberSequence(this.n, this.type);

  @override
  List<Object> get props => [n, type];
}
