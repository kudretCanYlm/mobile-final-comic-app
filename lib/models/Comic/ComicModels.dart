class ComicCardModelA {
  final String ComicId;
  final String ComicName;
  final String ImageBase64;
  final String ComicOwner;

  ComicCardModelA(
      this.ComicId, this.ComicName, this.ImageBase64, this.ComicOwner);
}

class ComicCardContiuneReadingModel {
  final String ComicId;
  final String ComicName;
  final String ImageBase64;
  final String ChapterName;

  ComicCardContiuneReadingModel(
      this.ComicId, this.ComicName, this.ImageBase64, this.ChapterName);
}
