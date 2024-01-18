
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/PointofviewEntity.dart';

class PointofviewModel extends PointofviewEntity
{
  PointofviewModel({
   int ? id,
   String ? Commenttext,
   String ? Commenttitle,
   List<String> ? Negativepoints,
   List<String> ? Positivepoints,
    double ? Score
}):super(id: id,Commenttext: Commenttext,Commenttitle: Commenttitle,Negativepoints: Negativepoints,Positivepoints: Positivepoints,Score: Score);

  factory PointofviewModel.fromJson(Map< String,dynamic > map)
  {
    return PointofviewModel(
      id: map["id"] ?? "",
      Score: map["score"].toDouble(),
        Positivepoints: (map["positivepoints"] as List<dynamic>?)?.cast<String>() ?? [],
        Negativepoints: (map["negativepoints"] as List<dynamic>?)?.cast<String>() ?? [],
      Commenttitle: map["commenttitle"] ?? "",
      Commenttext: map["commenttext"] ?? ""
    );
  }
}