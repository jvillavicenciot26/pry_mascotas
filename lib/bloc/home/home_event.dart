abstract class HomeEvent {}

class HomeGetProfileEvent extends HomeEvent {
  String id;
  HomeGetProfileEvent({required this.id});
}
