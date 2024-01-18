
import 'package:digikalaapp/Feature/Product/Domain/Entity/Userpoint/PointofviewEntity.dart';

class PointofviewModel extends PointofviewEntity
{
  PointofviewModel({
    id,
    Commenttext,
    Commenttitle,
    Negativepoints,
    Positivepoints,
    Score
}):super(id: id,Commenttext: Commenttext,Commenttitle: Commenttitle,Negativepoints: Negativepoints,Positivepoints: Positivepoints,Score: Score);
}