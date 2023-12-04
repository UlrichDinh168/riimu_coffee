import 'dart:convert';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'package:riimu_coffee/controllers/api/api.dart';
import 'package:riimu_coffee/models/person.dart';
import 'package:riimu_coffee/redux/people/people_state.dart';
import 'package:riimu_coffee/redux/store.dart';
import 'package:riimu_coffee/utils/parse_function.dart';

class SetPeopleAction {
  final PeopleState data;

  SetPeopleAction({required this.data});
}

Future<void> fetchPeopleData(
    Store<AppState> store, List<String> peopleIDs) async {
  // store.dispatch(SetPeopleAction(data: PeopleState.initial(isLoading: true)));

  try {
    final peopleDataResponse = await http.post(
      Uri.parse(endpoints['peopleData']!),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, List<String>>{
        'peopleIDs': peopleIDs,
      }),
    );

    if (peopleDataResponse.statusCode == 200) {
      final List<Person> peopleData = parsePerson(peopleDataResponse);

      final List<Person> existingPeople =
          List.from(store.state.peopleState.people);

      for (final Person personData in peopleData) {
        // Check if the person ID already exists in the store
        bool personExists =
            existingPeople.any((person) => person.id == personData.id);
        if (!personExists) {
          // If the person does not exist, add it to the store
          existingPeople.add(personData);
        }
      }

      await store.dispatch(
        SetPeopleAction(
          data: PeopleState(
            isError: false,
            isLoading: false,
            people: existingPeople,
          ),
        ),
      );
    }
  } catch (error) {
    print('Error decoding JSON at people action: $error');
    store.dispatch(const PeopleState(
      isLoading: false,
      isError: true,
      people: [Person(id: '', imageUrl: '', fullName: '', description: '')],
    ));
  }
}
