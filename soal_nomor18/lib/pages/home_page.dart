import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_nomor18/components/style.dart';
import 'package:soal_nomor18/models/people_model.dart';
import 'package:soal_nomor18/providers/people_view_model.dart';
import 'package:soal_nomor18/services/remote_services.dart';
import 'package:soal_nomor18/widgets/platform_widget.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  Widget buildList(BuildContext context) {
    late PeopleViewModel provider;

    return ChangeNotifierProvider<PeopleViewModel>(
      create: (_) => PeopleViewModel(remoteServices: RemoteServices()),
      child: Consumer<PeopleViewModel>(builder: (context, state, _) {
        provider = state;
        if (state.state == PeopleViewState.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorStyles.secondaryColor,
            ),
          );
        } else if (state.state == PeopleViewState.loaded) {
          final List<Result> restaurant = state.list;
          return ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: (context, index) {
              return buildListItem(context, restaurant[index]);
            },
          );
        } else if (state.state == PeopleViewState.loaded) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
                Text(
                  state.message,
                  // style: GoogleFonts.roboto(
                  //   fontSize: 16,
                  //   fontWeight: FontWeight.w500,
                  //   color: ColorStyles.tertiaryTextColor,
                  //   decoration: TextDecoration.none,
                  // ),
                ),
              ],
            ),
          );
        }else if (state.state == PeopleViewState.error) {
          return const Center(child: Text('Gagal mengambil data.'));
        }else {
          return Container();
        }
      }),
    );
  }

  Widget buildListItem(BuildContext context, Result people) {
    return SizedBox(
      height: 83,
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(0),
            child: ListTile(
              contentPadding:
              const EdgeInsets.all(8),
              // leading: Hero(
              //   tag: people.pictureId,
              //   child: Container(
              //     width: 100,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(4),
              //       image: DecorationImage(
              //         fit: BoxFit.cover,
              //         image: NetworkImage(RemoteServices.imgUrl + people.pictureId),
              //       ),
              //     ),
              //   ),
              // ),
              title: Text(
                people.name,
                // style: GoogleFonts.roboto(
                //   fontSize: 16,
                //   fontWeight: FontWeight.w500,
                //   color: ColorStyles.primaryTextColor,
                // ),
              ),
              subtitle: Column(
                children: <Widget>[
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      const Icon(
                        Icons.place,
                        size: 13,
                        // color: ColorStyles.secondaryColor,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        people.name,
                        // style: GoogleFonts.roboto(
                        //   fontSize: 13,
                        //   fontWeight: FontWeight.w300,
                        //   color: ColorStyles.ratingColor,
                        // ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Icons.star,
                  //       size: 16,
                  //       color: ColorStyles.ratingColor,
                  //     ),
                  //     const SizedBox(width: 3),
                  //     Text(
                  //       people.rating.toString(),
                  //       style: GoogleFonts.roboto(
                  //         fontSize: 14,
                  //         fontWeight: FontWeight.bold,
                  //         color: ColorStyles.ratingTextColor,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
              onTap: () {
                // Navigator.pushNamed(context, RestaurantDetailPage.routeName, arguments: restaurant);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'dekoki',
          // style: GoogleFonts.fredokaOne(
          //   fontSize: 30,
          //   color: ColorStyles.primaryColor,
          // ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              size: 34,
            ),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) => const RestaurantSearchPage()));
            },
          ),
        ],
      ),
      body: buildList(context),
    );
  }

  Widget buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'dekoki',
          // style: GoogleFonts.fredokaOne(
          //   fontSize: 30,
          //   color: ColorStyles.primaryColor,
          // ),
        ),
        trailing: GestureDetector(
          child: const Icon(
            CupertinoIcons.search,
            size: 34,
            color: ColorStyles.primaryColor,
          ),
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => const RestaurantSearchPage()));
          },
        ),
        backgroundColor: ColorStyles.secondaryColor,
        transitionBetweenRoutes: false,
      ),
      child: buildList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: buildAndroid, 
      iosBuilder: buildIos,
    );
  }
}

// class HomePage extends StatefulWidget {
//   const HomePage({ Key? key }) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
//       var viewModel = Provider.of<PeopleViewModel>(context, listen: false);
//       await viewModel.fetchPeople();
//     });
//   }

//   @override
//   Widget body(PeopleViewModel viewModel) {
//     if (viewModel.state == PeopleViewState.loading) {
//       return const Center(child: CircularProgressIndicator());
//     }else if (viewModel.state == PeopleViewState.loaded) {
//       final List<Result> people = viewModel.list;
//       return ListView.builder(
//         itemCount: people.length,
//         itemBuilder: (context, index){
//           // final people = viewModel.list.results[index];
//           // return buildItem(context, people[index]);
//           return SizedBox(
//             height: 83,
//             child: Column(
//               children: [
//                 Card(
//                   margin: const EdgeInsets.all(0),
//                   // child: ListTile(
//                   //   contentPadding: const EdgeInsets.all(8),
//                   //   leading: Hero(
//                   //     tag: people., 
//                   //     child: Container(

//                   //     ),
//                   //   ),
//                   // ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
//     }else if (viewModel.state == PeopleViewState.error) {
//       return const Center(child: Text('Gagal mengambil data.'));
//     }else {
//       return Container();
//     }
//   }

//   // Widget buildItem(BuildContext context, Result people) {
//   //   return SizedBox(
//   //     height: 83,
//   //     child: Column(
//   //       children: [
//   //         Card(
//   //           margin: const EdgeInsets.all(0),
//   //           child: ListTile(
//   //             contentPadding: const EdgeInsets.all(8),
//   //             leading: Hero(
//   //               tag: people.created, 
//   //               child: Container(

//   //               ),
//   //             ),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     PeopleViewModel viewModel = Provider.of<PeopleViewModel>(context);
//     return body(viewModel);
//   }
// }
