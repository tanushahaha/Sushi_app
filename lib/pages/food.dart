class Food {
  String Name;
  String Price;
  String Imagepath;
  String Rating ;

  Food({
    required this.Imagepath,
    required this.Name,
    required this.Price,
    required this.Rating
  });

  String get _Name => Name;
  String get _Price => Price;
  String get _Rating => Rating;
  String get _Imagepath => Imagepath;

}