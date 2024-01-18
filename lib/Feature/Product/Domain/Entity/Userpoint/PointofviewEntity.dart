
import 'package:equatable/equatable.dart';

class PointofviewEntity extends Equatable
{
  final int ? id;
  final String ? Commenttext;
  final String ? Commenttitle;
  final double ? Score;
  final List<String> ? Positivepoints;
  final List<String> ? Negativepoints;
  PointofviewEntity({
   this.id,
   this.Commenttext,
   this.Commenttitle,
   this.Negativepoints,
   this.Positivepoints,
   this.Score
});
  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      Commenttitle,
      Commenttext,
      id,
      Negativepoints,
      Positivepoints,
      Score
    ];
  }

}