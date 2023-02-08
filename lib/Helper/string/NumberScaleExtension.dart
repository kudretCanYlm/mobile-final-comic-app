extension NumberScaleExtension on double {
  double Scale(
    double start1,
    double stop1,
    double start2,
    double stop2,
  ) {
    final result =
        ((this - start1) / (stop1 - start1)) * (stop2 - start2) + start2;
    return result;
  }
}
