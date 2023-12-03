import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:riimu_coffee/models/person.dart';
import 'package:riimu_coffee/redux/people/people_state.dart';
import 'package:riimu_coffee/redux/store.dart';

class BeveragePersonInfo extends StatelessWidget {
  const BeveragePersonInfo({super.key, required this.peopleIds});

  // final List<Person> people;
  final List<String> peopleIds;

  List<Person> findPersonsByIds(
      List<String> peopleIds, List<Person> peopleList) {
    return peopleList.where((person) => peopleIds.contains(person.id)).toList();
  }

  // List<Person> foundPeople = findPersonsByIds(peopleIds, people);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeopleState>(
        converter: (store) => store.state.peopleState,
        builder: (context, peopleState) {
          return Container(
            margin: const EdgeInsets.only(top: 5),
            child: Row(
                children: findPersonsByIds(peopleIds, peopleState.people)
                    .map((person) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(person.imageUrl),
                      minRadius: 25,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          person.fullName,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                        Text(
                          person.description,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.primary),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
              );
            }).toList()),
          );
        });
  }
}
