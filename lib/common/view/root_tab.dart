import 'package:app/common/const/colors.dart';
import 'package:app/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListner);
  }

  void tabListner() {
    setState(() {
      index = controller.index;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.removeListener(tabListner);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      bottomNavigationbar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        selectedFontSize: 10,
        unselectedItemColor: BODY_TEXT_COLOR,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          controller.animateTo(index);
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: '음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '프로파일',
          ),
        ],
      ),
      child: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            child: const Text('홈'),
          ),
          Container(
            child: const Text('음식'),
          ),
          Container(
            child: const Text('주문'),
          ),
          Container(
            child: const Text('프로필'),
          ),
        ],
      ),
    );
  }
}
