enum RequestStatus {
  init,
  loading,
  success,
  error,
  canceled,
}

extension GetRequestStatus on RequestStatus {
  bool get isInit => this == RequestStatus.init;
  bool get isLoading => this == RequestStatus.loading;
  bool get isSuccess => this == RequestStatus.success;
  bool get isError => this == RequestStatus.error;
  bool get isCanceled => this == RequestStatus.canceled;
}
