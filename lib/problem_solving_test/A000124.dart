import 'dart:io';

String generateA000124(int n) {
  if (n <= 0) {
    return 'Input harus lebih besar dari 0';
  }

  List<int> sequence = [];

  for (int i = 0; i < n; i++) {
    int result = (i * (i + 1) ~/ 2) + 1;
    sequence.add(result);
  }

  return sequence.join('-');
}


// //DINAMIS
// void main() {
//   stdout.write('Masukkan jumlah: ');
//   String? input = stdin.readLineSync();

//   int? n = int.tryParse(input ?? '');

//   if (n == null) {
//     print('Error: input harus berupa bilangan bulat.');
//     return;
//   }

//   print('Output: ${generateA000124(n)}');
// }

void main() {
  print('Input: 3');
  print('Output: ${generateA000124(3)}');

  print('Input: 5');
  print('Output: ${generateA000124(5)}');

  print('Input: 7');
  print('Output: ${generateA000124(7)}');
}
