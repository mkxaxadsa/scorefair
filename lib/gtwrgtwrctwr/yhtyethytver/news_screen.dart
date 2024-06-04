import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:forLeader/gwtrgwrcrwe/models/actions.dart';
import 'package:forLeader/gtwgwtr.dart';
import 'package:forLeader/hwtrhtwcwe.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            title: Row(
              children: [
                Text(
                  'News',
                  style: context.textTheme.displayMedium,
                ),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: fdsfds.length,
            itemBuilder: (context, index) {
              final action = fdsfds[index];
              return ActionItem(action: action);
            },
          ),
        ],
      ),
    );
  }
}

class ActionItem extends StatelessWidget {
  const ActionItem({super.key, required this.action});
  final HDUIASd action;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(MyRouter.newsDetail, extra: action),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                action.img,
                width: MediaQuery.of(context).size.width - 32,
                height: MediaQuery.of(context).size.width - 32,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              DateFormat('dd MMMM,yyyy').format(action.dateTime),
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 224, 223, 223),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              action.title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
                color: MyTheme.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              action.subtitle,
              style: const TextStyle(color: MyTheme.grey, fontSize: 16),
              maxLines: 7,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
