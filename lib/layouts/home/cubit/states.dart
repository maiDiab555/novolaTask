abstract class HomeStates{}

class HomeInitialState extends HomeStates{}


class HomeLoadingState  extends HomeStates {}

class HomeSuccessState  extends HomeStates { }


class HomeErrorStateState  extends HomeStates {
  final String error;

  HomeErrorStateState(this.error);

}


