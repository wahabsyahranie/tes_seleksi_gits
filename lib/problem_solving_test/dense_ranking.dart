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

void main() {
  stdout.write('Jumlah pemain: ');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  if (n == null || n <= 0) {
    print('Error: Jumlah tidak valid.');
    return;
  }

  stdout.write('Masukkan skor pemain:');
  List<int>? ranked = parseScores(stdin.readLineSync() ?? '');

  if (ranked == null || ranked.length != n) {
    print('Error: Jumlah skor tidak sesuai.');
    return;
  }

  stdout.write('Jumlah permainan GITS: ');
  int? m = int.tryParse(stdin.readLineSync() ?? '');

  if (m == null || m <= 0) {
    print('Error: Jumlah permainan tidak valid');
    return;
  }

  stdout.write('Masukkan skor GITS: ');
  List<int>? player = parseScores(stdin.readLineSync() ?? '');

  if (player == null || player.length != m) {
    print('Error: Jumlah skor GITS tidak sesuai.');
    return;
  }

  List<int> result = denseRanking(ranked, player);

  print('Output: ${result.join(' ')}');
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
