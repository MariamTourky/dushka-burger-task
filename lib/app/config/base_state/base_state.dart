enum Status { loading, success, error, initial }

class BaseState<T> {
  final Status status;
  T? data;
  String? error;

  BaseState({required this.status, this.data, this.error});

  factory BaseState.success(T? data) {
    return BaseState<T>(status: Status.success, data: data);
  }
  factory BaseState.loading() {
    return BaseState<T>(status: Status.loading);
  }
  factory BaseState.error(String error) {
    return BaseState<T>(status: Status.error, error: error);
  }
  factory BaseState.initial() {
    return BaseState<T>(status: Status.initial);
  }

  bool get isSuccess => status == Status.success;
  bool get isLoading => status == Status.loading;
  bool get isError => status == Status.error;
  bool get isInitial => status == Status.initial;
}
