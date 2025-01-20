import 'package:bingo/data/response/status.dart';
import 'package:bingo/model/movies_model.dart';
import 'package:bingo/repository/home_repository.dart';
import 'package:bingo/utils/routes/routes_name.dart';
import 'package:bingo/view_model/home_view_model.dart';
import 'package:bingo/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    homeViewModel.fetchMoviesListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              userPreference.removeUser().then((value) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutesName.login,
                  (Route<dynamic> route) => false,
                );
              });
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeViewModel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.ERROR:
                return Center(
                  child: Text(value.moviesList.message.toString()),
                );
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case Status.COMPLETED:
                return Card(
                  child: ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (BuildContext context, int index) {
                      Movies tileData = value.moviesList.data!.movies![index];
                      return ListTile(
                        leading: Image.network(
                          // height: 80,
                          width: 60,
                          fit: BoxFit.cover,
                          tileData.posterurl!,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.error,
                              color: Colors.red,
                            );
                          },
                        ),
                        
                        title: Text(tileData.title!),
                        subtitle: Text(tileData.year!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                HomeRepository.averageRatings(tileData.ratings!)
                                    .toStringAsFixed(1)),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                );
              case null:
                return const Center(child: Text('Data is Null'));
            }
          },
        ),
      ),
    );
  }
}
