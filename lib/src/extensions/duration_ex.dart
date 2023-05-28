extension DurationEx on Duration {
  String formatted() {
    if (inDays != 0) {
      return '${inDays.remainder(60).toString().padLeft(2, '0')}:${inHours.remainder(60).toString().padLeft(2, '0')}:${inMinutes.remainder(60).toString().padLeft(2, '0')}:${inSeconds.remainder(60).toString().padLeft(2, '0')}';
    } else if (inHours != 0) {
      return '${inHours.remainder(60).toString().padLeft(2, '0')}:${inMinutes.remainder(60).toString().padLeft(2, '0')}:${inSeconds.remainder(60).toString().padLeft(2, '0')}';
    } else if (inMinutes != 0) {
      return '${inMinutes.remainder(60).toString().padLeft(2, '0')}:${inSeconds.remainder(60).toString().padLeft(2, '0')}';
    } else if (inSeconds != 0) {
      return '00:${inSeconds.remainder(60).toString().padLeft(2, '0')}';
    } else {
      return '00:00';
    }
  }
}
