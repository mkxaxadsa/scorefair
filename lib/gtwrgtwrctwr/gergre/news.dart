import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:forLeader/gwtrgwrcrwe/gfdgdf/fdsfsd.dart';
import 'package:forLeader/hwtrhtwcwe.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key, required this.dfasfdasf});
  final HDUIASd dfasfdasf;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Row(
                children: [
                  Icon(Icons.chevron_left, color: MyTheme.white),
                  SizedBox(width: 8),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: MyTheme.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              dfasfdasf.img,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd MMMM,yyyy').format(dfasfdasf.dateTime),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF979797),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    dfasfdasf.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: MyTheme.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    dfasfdasf.subtitle,
                    style: const TextStyle(color: MyTheme.white, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
