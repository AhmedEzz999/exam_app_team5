import 'failures.dart';

class ServiceFailures implements Failures {
  ServiceFailures({required this.errorMessage});
  @override
  final String errorMessage;
}
