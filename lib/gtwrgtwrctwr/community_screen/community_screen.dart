import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:forLeader/gwtrgwrcrwe/models/actions.dart';
import 'package:forLeader/gtwgwtr.dart';
import 'package:forLeader/hwtrhtwcwe.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

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
                  'Community',
                  style: context.textTheme.displayMedium,
                ),
              ],
            ),
          ),
          SliverList.builder(
            itemCount: dfasdfsdf.length,
            itemBuilder: (context, index) {
              final action = dfasdfsdf[index];
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
      onTap: () => context.pushNamed(MyRouter.communityDetail, extra: action),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    action.img,
                    width: MediaQuery.of(context).size.width - 32,
                    height: (MediaQuery.of(context).size.width - 32) / 2,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: MyTheme.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.play_arrow_sharp,
                        size: 40,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              action.title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
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
            Text(
              DateFormat('dd MMMM,yyyy').format(action.dateTime),
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 181, 181, 181),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
