import 'dart:io';

bool isNumeric(String s, int index) {
  if (index >= s.length) {
    return true;
  }

  int digit = s.codeUnitAt(index);

  if (digit < 48 || digit > 57) {
    return false;
  }

  return isNumeric(s, index + 1);
}

int? makePalindrome(
  List<String> digits,
  List<bool> changed,
  int left,
  int right,
  int remaining,
) {
  if (left >= right) {
    return remaining;
  }

  if (digits[left] != digits[right]) {
    if (remaining < 1) {
      return null;
    }

    String larger = digits[left].compareTo(digits[right]) > 0
        ? digits[left]
        : digits[right];

    digits[left] = larger;
    digits[right] = larger;

    changed[left] = true;
    changed[right] = true;

    return makePalindrome(digits, changed, left + 1, right - 1, remaining - 1);
  }

  return makePalindrome(digits, changed, left + 1, right - 1, remaining);
}

int maximizePalindrome(
  List<String> digits,
  List<bool> changed,
  int left,
  int right,
  int remaining,
) {
  if (left > right) {
    return remaining;
  }

  int cost;

  if (left == right) {
    cost = digits[left] == '9' ? 0 : 1;
  } else if (digits[left] == '9' && digits[right] == '9') {
    cost = 0;
  } else if (changed[left] || changed[right]) {
    cost = 1;
  } else {
    cost = 2;
  }

  if (remaining >= cost) {
    digits[left] = '9';
    digits[right] = '9';

    return maximizePalindrome(
      digits,
      changed,
      left + 1,
      right - 1,
      remaining - cost,
    );
  }

  return maximizePalindrome(digits, changed, left + 1, right - 1, remaining);
}

String highestPalindrome(String s, int k) {
  if (s.isEmpty || k < 0 || !isNumeric(s, 0)) {
    return '-1';
  }

  List<String> digits = s.split('');
  List<bool> changed = List.filled(s.length, false);

  int? remaining = makePalindrome(digits, changed, 0, digits.length - 1, k);

  if (remaining == null) {
    return '-1';
  }

  maximizePalindrome(digits, changed, 0, digits.length - 1, remaining);

  return digits.join('');
}

void main() {
  stdout.write('Masukkan anga: ');
  String s = stdin.readLineSync() ?? '';

  stdout.write('Masukkan jumlah perubahan (k): ');
  int? k = int.tryParse(stdin.readLineSync() ?? '');

  if (k == null) {
    print('output: -1');
    return;
  }

  String result = highestPalindrome(s, k);

  print('Output: $result');
}
