import 'dart:async';

void main() {
  print("Processing...");

  Future.delayed(const Duration(seconds: 1), () {
    print("life is never flat");
  });

  print("Please wait...");
}
