import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/repo.dart';

class GithubItem extends StatelessWidget {
  final Repo repo;
  const GithubItem(this.repo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            Navigator.pop(context,
                {'html_url': repo.html_url, 'languagesUrl': repo.languagesUrl});
          },
          highlightColor: Colors.lightBlueAccent,
          splashColor: Colors.red,
          child: Container(
            color: Color(0xff111625),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text((repo.name != null) ? repo.name : '-',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: Colors.white)),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                    child: Text(repo.description ?? 'No desription',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: Colors.white)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text((repo.owner != null) ? repo.owner : '',
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.white))),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 4.0),
                                child: Text(
                                    (repo.watchersCount != null)
                                        ? '${repo.watchersCount} '
                                        : '0 ',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          )),
    );
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}
