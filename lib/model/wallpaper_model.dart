class Wallpaper_Model{
  late String photographer;
  late String photographer_url;
  late int photographer_id;
  late SrcModel src;

  Wallpaper_Model({
      required this.photographer,  required this.photographer_url, required this.photographer_id, required this.src});
  factory Wallpaper_Model.fromMap(Map<String , dynamic> jsonData){
    return Wallpaper_Model(
      photographer: jsonData["photographer"]
      , photographer_url: jsonData["photographer_url"] ,  photographer_id: jsonData["photographer_id"], src:SrcModel.fromMap(jsonData["src"])
    );
  }
}
class SrcModel{
  late String original;
  late String small;
  late String portrait;

  SrcModel({required this.original, required this.small, required this.portrait});
  factory SrcModel.fromMap(Map<String , dynamic> jsondata){
    return SrcModel(original: jsondata["original"], small: jsondata["small"], portrait: jsondata["portrait"]);
  }
}