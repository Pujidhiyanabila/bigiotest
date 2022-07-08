import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soal_nomor18/models/people_model.dart';
import 'package:soal_nomor18/providers/database_provider.dart';

class PeopleWidget extends StatelessWidget {
  final PeopleModel peopleModel;

  const PeopleWidget({required this.peopleModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(peopleModel.url),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return Material(
              child: ListTile(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                // leading: Hero(
                //   tag: peopleModel.urlToImage!,
                //   child: Image.network(
                //     peopleModel.urlToImage!,
                //     width: 100,
                //   ),
                // ),
                title: Text(
                  peopleModel.title,
                ),
                subtitle: Text(peopleModel.author ?? ""),
                trailing: isBookmarked
                    ? IconButton(
                  icon: Icon(Icons.bookmark),
                  color: Theme.of(context).accentColor,
                  onPressed: () => provider.removeBookmark(peopleModel.url),
                )
                    : IconButton(
                  icon: Icon(Icons.bookmark_border),
                  color: Theme.of(context).accentColor,
                  onPressed: () => provider.addBookmark(peopleModel),
                ),
                onTap: () => Navigation.intentWithData(
                    ArticleDetailPage.routeName, peopleModel),
              ),
            );
          },
        );
      },
    );
  }
}
