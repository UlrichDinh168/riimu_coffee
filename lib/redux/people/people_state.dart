import 'package:meta/meta.dart';

import 'package:riimu_coffee/models/person.dart';

@immutable
class PeopleState {
  final bool isError;
  final bool isLoading;
  final List<Person> people;

  const PeopleState({
    required this.isError,
    required this.isLoading,
    required this.people,
  });

  factory PeopleState.initial({bool isError = false, bool isLoading = false}) {
    return const PeopleState(
      isLoading: false,
      isError: false,
      people: [],
    );
  }

  @override
  String toString() {
    return 'PeopleState{isError: $isError, isLoading: $isLoading, people: $people}';
  }

  PeopleState copyWith({
    bool? isError,
    bool? isLoading,
    List<Person>? people,
  }) {
    return PeopleState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      people: people ?? this.people,
    );
  }
}
