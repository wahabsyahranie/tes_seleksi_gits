import 'dart:io';

List<int> denseRanking(List<int> ranked, List<int> player) {
  List<int> uniqueScores = ranked.toSet().toList();

  uniqueScores.sort((a, b) => b.compareTo(a));

  List<int> results = [];

  for (int score in player) {
    int low = 0;
    int high = uniqueScores.length;

    while (low < high) {
      int mid = (low + high) ~/ 2;

      if (uniqueScores[mid] > score) {
        low = mid + 1;
      } else {
        high = mid;
      }
    }

    results.add(low + 1);
  }

  return results;
}

// //DINAMIS
// void main() {
//   stdout.write('Jumlah pemain: ');
//   int? n = int.tryParse(stdin.readLineSync() ?? '');

//   if (n == null || n <= 0) {
//     print('Error: Jumlah tidak valid.');
//     return;
//   }

//   stdout.write('Masukkan skor pemain:');
//   List<int>? ranked = parseScores(stdin.readLineSync() ?? '');

//   if (ranked == null || ranked.length != n) {
//     print('Error: Jumlah skor tidak sesuai.');
//     return;
//   }

//   stdout.write('Jumlah permainan GITS: ');
//   int? m = int.tryParse(stdin.readLineSync() ?? '');

//   if (m == null || m <= 0) {
//     print('Error: Jumlah permainan tidak valid');
//     return;
//   }

//   stdout.write('Masukkan skor GITS: ');
//   List<int>? player = parseScores(stdin.readLineSync() ?? '');

//   if (player == null || player.length != m) {
//     print('Error: Jumlah skor GITS tidak sesuai.');
//     return;
//   }

//   List<int> result = denseRanking(ranked, player);

//   print('Output: ${result.join(' ')}');
// }

void main() {
  List<int> ranked1 = [100, 100, 50, 40, 40, 20, 10];
  List<int> player1 = [5, 25, 50, 120];

  print('Case 1');
  print('Input Ranked: ${ranked1.join(' ')}');
  print('Input Player: ${player1.join(' ')}');
  print('Output: ${denseRanking(ranked1, player1).join(' ')}');

  print('');

  List<int> ranked2 = [100, 90, 90, 80, 70];
  List<int> player2 = [90, 85, 70, 50];

  print('Case 2');
  print('Input Ranked: ${ranked2.join(' ')}');
  print('Input Player: ${player2.join(' ')}');
  print('Output: ${denseRanking(ranked2, player2).join(' ')}');

  print('');

  List<int> ranked3 = [500, 400, 400, 300, 200, 100];
  List<int> player3 = [600, 400, 350, 100, 50];

  print('Case 3');
  print('Input Ranked: ${ranked3.join(' ')}');
  print('Input Player: ${player3.join(' ')}');
  print('Output: ${denseRanking(ranked3, player3).join(' ')}');
}

List<int>? parseScores(String input) {
  try {
    return input
        .trim()
        .split(RegExp(r'\s+'))
        .map((value) => int.parse(value))
        .toList();
  } catch (e) {
    return null;
  }
}
