class GenerateNumberSequenceUseCase {
  List<String> call(int n, int type) {
    List<String> sequence = [];

    switch (type) {
      case 1:
        for (int i = 1; i <= n; i++) {
          sequence.add('$i');
        }
        break;
      case 2:
        for (int i = 1; i <= n; i++) {
          sequence.add('$i');
        }
        for (int i = n - 1; i >= 1; i--) {
          sequence.add('$i');
        }
        break;
      case 3:
        for (int i = 1; i <= n; i++) {
          sequence.add('${i * 10 + i - 1}');
        }
        break;
      case 4:
        for (int i = 1; i <= n; i++) {
          if (i % 5 == 0) {
            sequence.add('LIMA');
          } else if (i % 7 == 0) {
            sequence.add('TUJUH');
          } else {
            sequence.add('$i');
          }
        }
        break;
    }

    return sequence;
  }
}
