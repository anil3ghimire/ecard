void main() {
  // try {
  //   int result = 10 ~/ 0; // ❌ will cause error
  //   print(result);
  // } catch (e) {
  //   print("Error caught: $e");
  // } finally {
  //   print("This always runs");
  // }

  try {
    int result = 10 ~/ 2;
    print('object$result');
  } catch (e) {
    print("Error caught $e");
  } finally {
    print("Both case error or not error ");
  }
}
