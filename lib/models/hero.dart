class MarvelHero {
  late String name;
  late String description;
  late String imagePath;
 // String imageBGPath ='assets/images/background/bluebg.png';

  MarvelHero(
   //String? imageBGPath,
  {
    required this.name, 
    required this.description, 
    required this.imagePath, 
  }
  );


  MarvelHero.fromJson(Map<String, dynamic> json, String imageBGPath){
    name = json['name'];
    description = json['description'];
    imagePath = json['thumbnail']['path'] + '.' + json['thumbnail']['extension'];
    //this.imageBGPath = imageBGPath;
  }
}