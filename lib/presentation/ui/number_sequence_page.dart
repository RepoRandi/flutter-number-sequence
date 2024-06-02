import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_sequence/presentation/bloc/number/number_bloc.dart';
import 'package:number_sequence/presentation/bloc/number/number_event.dart';
import 'package:number_sequence/presentation/bloc/number/number_state.dart';

class NumberSequencePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  NumberSequencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Sequence App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Input N',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: BlocBuilder<NumberBloc, NumberState>(
                builder: (context, state) {
                  int activeButton = -1;
                  if (state is NumberGenerated) {
                    activeButton = state.activeButton;
                  }
                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 2.5,
                    children: <Widget>[
                      SizedBox(
                        width: 80,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                activeButton == 1 ? Colors.deepPurple : null,
                          ),
                          onPressed: () {
                            final n = int.parse(_controller.text);
                            BlocProvider.of<NumberBloc>(context)
                                .add(GenerateNumberSequence(n, 1));
                          },
                          child: Text(
                            '1',
                            style: TextStyle(
                              color: activeButton == 1 ? Colors.white : null,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                activeButton == 2 ? Colors.deepPurple : null,
                          ),
                          onPressed: () {
                            final n = int.parse(_controller.text);
                            BlocProvider.of<NumberBloc>(context)
                                .add(GenerateNumberSequence(n, 2));
                          },
                          child: Text(
                            '2',
                            style: TextStyle(
                              color: activeButton == 2 ? Colors.white : null,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                activeButton == 3 ? Colors.deepPurple : null,
                          ),
                          onPressed: () {
                            final n = int.parse(_controller.text);
                            BlocProvider.of<NumberBloc>(context)
                                .add(GenerateNumberSequence(n, 3));
                          },
                          child: Text(
                            '3',
                            style: TextStyle(
                              color: activeButton == 3 ? Colors.white : null,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80,
                        height: 40,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                activeButton == 4 ? Colors.deepPurple : null,
                          ),
                          onPressed: () {
                            final n = int.parse(_controller.text);
                            BlocProvider.of<NumberBloc>(context)
                                .add(GenerateNumberSequence(n, 4));
                          },
                          child: Text(
                            '4',
                            style: TextStyle(
                              color: activeButton == 4 ? Colors.white : null,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<NumberBloc, NumberState>(
                builder: (context, state) {
                  if (state is NumberInitial) {
                    return const Center(
                        child: Text('Enter a number and select a sequence.'));
                  } else if (state is NumberGenerated) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Result:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            state.sequence.join(' '),
                            style: const TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
