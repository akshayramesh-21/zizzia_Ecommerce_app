part of 'banner_bloc.dart';

@immutable
sealed class BannerState {}

final class BannerInitial extends BannerState {}
 class BannerLoading extends BannerState{}

class BannerLoaded extends BannerState {
  final List<BannerClass> bannerItems;

  BannerLoaded(this.bannerItems);
}

class ErrorState extends BannerState{
  final message;
  ErrorState({this.message});
}