import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:forLeader/hwtrhtwcwe.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Text(
              'Settings',
              style: context.textTheme.displayMedium,
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
          dwasfasf(
            s: 'Privacy Policy',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DFASNjkfsd(
                    n: 'https://docs.google.com/document/d/1Zv7nzQ2C-Z0cho0IIcw_PmSff9ls7LwyTrhHwDLBta4/edit?usp=sharing'),
              ),
            ),
            path: 'images/svg/privacy.svg',
          ),
          dwasfasf(
            s: 'Terms of Use',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DFASNjkfsd(
                    n: 'https://docs.google.com/document/d/1RA6eK4ptowq6W5h2gGz6i9M-2EJq6NqKy14-KlEhF48/edit?usp=sharing'),
              ),
            ),
            path: 'images/svg/terms.svg',
          ),
          dwasfasf(
            s: 'Rate app',
            onPressed: () =>
                InAppReview.instance.openStoreListing(appStoreId: '6503641733'),
            path: 'images/svg/rate.svg',
          ),
        ],
      ),
    );
  }
}

class dwasfasf extends StatelessWidget {
  const dwasfasf({
    super.key,
    required this.s,
    required this.onPressed,
    required this.path,
  });

  final String s;
  final VoidCallback onPressed;
  final String path;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                s,
                style: const TextStyle(color: MyTheme.white, fontSize: 16),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: MyTheme.white,
            ),
          ],
        ),
      ),
    );
  }
}

class DFASNjkfsd extends StatefulWidget {
  const DFASNjkfsd({super.key, required this.n});
  final String n;

  @override
  State<DFASNjkfsd> createState() => _DFASNjkfsdState();
}

class _DFASNjkfsdState extends State<DFASNjkfsd> {
  var _progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(
          child: InkWell(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            InAppWebView(
              onLoadStop: (controller, url) {
                controller.evaluateJavascript(
                    source:
                        "javascript:(function() { var ele=document.getElementsByClassName('docs-ml-header-item docs-ml-header-drive-link');ele[0].parentNode.removeChild(ele[0]);var footer = document.getelementsbytagname('footer')[0];footer.parentnode.removechild(footer);})()");
              },
              onProgressChanged: (controller, progress) => setState(() {
                _progress = progress;
              }),
              initialUrlRequest: URLRequest(
                url: Uri.parse(widget.n),
              ),
            ),
            if (_progress != 100)
              Container(
                color: Colors.white,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
