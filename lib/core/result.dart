class Result<T> {
  final T? _value;
  final String? _error;
  final bool _isLoading;
  final bool _isInitial;

  const Result._({
    T? value,
    String? error,
    bool isLoading = false,
    bool isInitial = false,
  })  : _value = value,
        _error = error,
        _isLoading = isLoading,
        _isInitial = isInitial;

  const Result.initial() : this._(isInitial: true);
  const Result.loading() : this._(isLoading: true);
  const Result.success(T value) : this._(value: value);
  const Result.error(String message) : this._(error: message);

  bool get isInitial => _isInitial;
  bool get isLoading => _isLoading;
  bool get isSuccess => !_isInitial && !_isLoading && _error == null;
  bool get isError => _error != null;

  T get value => _value as T;
  String get error => _error!;
}
