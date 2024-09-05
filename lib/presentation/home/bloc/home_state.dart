part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  const HomeState({
    this.message,
    this.additionalItem = const [],
    this.total = 0,
    this.totalPerPerson = 0,
  });
  final String? message;
  final List<AdditionalItem> additionalItem;
  final double total;
  final double totalPerPerson;
}

final class HomeInitial extends HomeState {
  HomeInitial()
      : super(
          additionalItem: [
            AdditionalItem(name: '', price: 0),
          ],
        );
}

final class HomeLoading extends HomeState {
  const HomeLoading() : super();
}

final class HomeLoaded extends HomeState {
  const HomeLoaded({
    required super.additionalItem,
  });
}

final class HomeError extends HomeState {
  const HomeError({
    required super.message,
  });
}

final class HomeSaved extends HomeState {
  const HomeSaved({
    required super.total,
    required super.totalPerPerson,
  });
}
