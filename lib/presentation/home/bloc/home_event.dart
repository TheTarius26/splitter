part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  const HomeEvent();
}

class HomeInitialEvent extends HomeEvent {
  const HomeInitialEvent();
}

class HomeLoadEvent extends HomeEvent {
  const HomeLoadEvent();
}

class HomeAddItemEvent extends HomeEvent {
  const HomeAddItemEvent(this.item);

  final AdditionalItem item;
}

class HomeDeleteItemEvent extends HomeEvent {
  const HomeDeleteItemEvent(this.index);

  final int index;
}

class HomeUpdateItemEvent extends HomeEvent {
  const HomeUpdateItemEvent(this.index, this.item);

  final int index;
  final AdditionalItem item;
}

class HomeSaveEvent extends HomeEvent {
  const HomeSaveEvent();
}
