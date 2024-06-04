import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:forLeader/gwtrgwrcrwe/api/matc_api.dart';
import 'package:forLeader/gwtrgwrcrwe/gfdgdf/match.dart';
import 'package:forLeader/gtwgwtr.dart';
import 'package:forLeader/hwtrhtwcwe.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  var _pickedDateTime = DateTime.now();
  List<FootballMatch> _matches = [];

  @override
  void initState() {
    super.initState();
    _startMatches();
  }

  Future<void> _startMatches() async {
    final matches = await MatchesApi().fetchMatches(_pickedDateTime);
    setState(() {
      _matches = matches;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 0,
            backgroundColor: Colors.black,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Football',
                          style: context.textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 60,
                    color: MyTheme.black,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ...List.generate(
                            10,
                            (index) {
                              final now = DateTime.now();
                              final date = now.add(Duration(days: index));

                              return InkWell(
                                onTap: () async {
                                  setState(() {
                                    _pickedDateTime = date;
                                    _matches = [];
                                  });
                                  var newMatches = await MatchesApi()
                                      .fetchMatches(_pickedDateTime);
                                  setState(() {
                                    _matches = newMatches;
                                  });
                                },
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  padding: const EdgeInsets.only(
                                      left: 4, right: 4, top: 8),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FittedBox(
                                        child: Text(
                                          index == 0
                                              ? 'Today'
                                              : DateFormat('EEE').format(date),
                                          style: TextStyle(
                                            color: date.equal(_pickedDateTime)
                                                ? Colors.green
                                                : MyTheme.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      FittedBox(
                                        child: Text(
                                          DateFormat('dd MMM').format(date),
                                          style: const TextStyle(
                                            color: MyTheme.grey,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        opacity:
                                            date.equal(_pickedDateTime) ? 1 : 0,
                                        child: Container(
                                          height: 4,
                                          width: double.infinity,
                                          color: Colors.purple,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _matches.isEmpty
              ? SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                )
              : SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList.builder(
                    itemCount: _matches.length,
                    itemBuilder: (context, index) {
                      final match = _matches[index];
                      return GestureDetector(
                        onTap: () => context.pushNamed(MyRouter.matchDetail,
                            extra: match),
                        child: FootballMatchItem(match: match),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

class FootballMatchItem extends StatefulWidget {
  const FootballMatchItem({super.key, required this.match});
  final FootballMatch match;

  @override
  State<FootballMatchItem> createState() => _FootballMatchItemState();
}

class _FootballMatchItemState extends State<FootballMatchItem> {
  var _bookmark = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 24, 23, 23),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      child: Row(
        children: [
          Text(
            DateFormat('HH:mm').format(widget.match.time),
            style: TextStyle(
              fontSize: 16,
              color: MyTheme.white,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.match.homeGoals.toString(),
                      style: const TextStyle(
                        color: MyTheme.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const SizedBox(width: 4),
                    Text(
                      widget.match.homeTeamTitle,
                      style: const TextStyle(
                        color: MyTheme.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.match.awayGoals.toString(),
                      style: const TextStyle(
                        color: MyTheme.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const SizedBox(width: 4),
                    Text(
                      widget.match.awayTeamTitle,
                      style: const TextStyle(
                        color: MyTheme.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _bookmark = !_bookmark;
              });
            },
            child: SvgPicture.asset(
              'images/svg/bookmark.svg',
              colorFilter: ColorFilter.mode(
                  _bookmark ? Colors.purple : const Color(0xFFDDDDDD),
                  BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}

extension DateTimeExt on DateTime {
  bool equal(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
