import 'package:flutter/material.dart';
import 'package:starwars/data/model/people_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.people}) : super(key: key);

  final Results people;

  @override
  Widget build(BuildContext context) {
    print(people);

    return Scaffold(
      appBar: AppBar(
        title: Text(people.name ?? 'Uknown'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        children: [
          const _Title(text: 'General information'),
          const SizedBox(height: 20),
          _Subtitle(title: 'Eye Color', subtitle: people.eyeColor),
          _Subtitle(title: 'Hair Color', subtitle: people.hairColor),
          _Subtitle(title: 'Skin Color', subtitle: people.skinColor),
          _Subtitle(title: 'Birth Year', subtitle: people.birthYear),
          const SizedBox(height: 20),
          const _Title(text: 'Vehicles'),
          const SizedBox(height: 20),
          people.vehiclesName!.isEmpty
              ? const _NoVehicles()
              : Column(
                  children: List.generate(
                    people.vehiclesName?.length ?? 0,
                    (index) => _Subtitle(
                        title: people.vehiclesName![index], subtitle: ''),
                  ),
                )
        ],
      ),
    );
  }
}

class _NoVehicles extends StatelessWidget {
  const _NoVehicles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Sin vehiculos',
        style:
            Theme.of(context).textTheme.headline6!.copyWith(color: Colors.grey),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key, required this.text}) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'Uknown',
      style: Theme.of(context).textTheme.headline6,
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String? title, subtitle;

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title ?? 'Uknown',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.grey),
              ),
            ),
            Text(
              subtitle == '' ? '' : capitalize(subtitle ?? 'Uknown'),
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
