import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:starwars/data/model/people_model.dart';
import 'package:starwars/data/services/star_wars_api.dart';
import 'package:starwars/domain/repository/star_wars_repository.dart';
import 'package:starwars/ui/widgets/error.dart';
import 'package:starwars/ui/widgets/loading.dart';

import 'details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StarWarsRepository _api = StarWarsImplementation(StarWarsApi());

  late final ScrollController scrollController = ScrollController();

  StarWarModel? initialData;
  bool loadingDataInitial = true;
  bool loadingData = false;
  List<Results> resultsPeople = [];
  int page = 3;
  String? nextUrlPage;

  //listener
  void scrollListener() {
    if (initialData?.next != null) {
      if (scrollController.position.maxScrollExtent <=
              scrollController.offset &&
          !loadingData) {
        getData();
      }
    }
  }

  void getInitialData() {
    _api.getPeople().then(
      (value) {
        initialData = value;
        resultsPeople.addAll(value?.results ?? []);
      },
    );

    _api.getPeople(page: 2).then(
      (value) {
        initialData = value;
        setState(
          () {
            resultsPeople.addAll(value?.results ?? []);
            loadingDataInitial = false;
          },
        );
      },
    );
  }

  void getData() {
    setState(() {
      loadingData = true;
    });
    _api.getPeople(page: page).then(
      (value) {
        initialData = value;
        setState(() {
          resultsPeople.addAll(initialData?.results ?? []);
          loadingData = false;
          page++;
        });
      },
    );
  }

  @override
  void initState() {
    getInitialData();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: loadingDataInitial
          ? const MyLoading()
          : resultsPeople.isEmpty
              ? const MyError()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: scrollController,
                        itemCount: resultsPeople.length,
                        itemBuilder: (context, i) {
                          Results people = resultsPeople[i];
                          if (i == resultsPeople.length - 1) {
                            return Column(
                              children: [
                                _ItemPeople(people: people),
                                if (loadingData) const MyLoading()
                              ],
                            );
                          }
                          return _ItemPeople(people: people);
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}

class _ItemPeople extends StatelessWidget {
  const _ItemPeople({Key? key, required this.people}) : super(key: key);

  final Results people;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => DetailsPage(people: people),
        ),
      ),
      title: Text(people.name ?? 'Uknown'),
      subtitle: Text((people.specieName ?? 'Unknow') +
          ' from ' +
          (people.planetName ?? 'Uknow')),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
    );
  }
}
