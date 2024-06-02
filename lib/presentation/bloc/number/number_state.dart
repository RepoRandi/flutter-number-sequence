import 'package:equatable/equatable.dart';

abstract class NumberState extends Equatable {
  const NumberState();
}

class NumberInitial extends NumberState {
  @override
  List<Object> get props => [];
}

class NumberGenerated extends NumberState {
  final List<String> sequence;
  final int activeButton;

  const NumberGenerated(this.sequence, this.activeButton);

  @override
  List<Object> get props => [sequence, activeButton];
}
