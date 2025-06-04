import 'package:evently/core/firestoreHandeler.dart';
import 'package:evently/core/resources/assets_manager.dart';
import 'package:evently/core/resources/colors_manager.dart';
import 'package:evently/core/resources/routes/routes_manager.dart';
import 'package:evently/providers/user_provider.dart';
import 'package:evently/ui/home/Tabs/fav_tab/love_tab.dart';
import 'package:evently/ui/home/Tabs/home_tab/home_tab.dart';
import 'package:evently/ui/home/Tabs/map_tab/map_tab.dart';
import 'package:evently/ui/home/Tabs/profile_tab/profile_tab.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:evently/model/user.dart' as my_user;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTap = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), LoveTab(), ProfileTab()];
  @override
  void initState() {
    super.initState();
    getFirestoreUser();
  }

 getFirestoreUser() async {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);
    if (provider.myUser == null) {
      my_user.User? user = await Firestorehandeler.getUser(
        FirebaseAuth.instance.currentUser?.uid ?? "",
      );
      provider.SaveUser(user);
    }
}

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:
            provider.myUser == null
                ? Center(child: CircularProgressIndicator())
                : Text(provider.myUser?.name ?? ""),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushReplacementNamed(context, RoutesManager.login);
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTap,
        selectedItemColor: ColorsManager.white,
        unselectedItemColor: ColorsManager.white,
        onTap: (value) {
          selectedTap = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: SvgPicture.asset(
              AssetsManager.homeLogo,
              height: 24.h,
              width: 24.h,
            ),
            activeIcon: SvgPicture.asset(
              AssetsManager.selectedHome,
              height: 24.h,
              width: 24.h,
            ),
          ),
          BottomNavigationBarItem(
            label: "Map",
            icon: SvgPicture.asset(
              AssetsManager.map,
              height: 24.h,
              width: 24.h,
            ),
            activeIcon: SvgPicture.asset(
              AssetsManager.selectedMap,
              height: 24.h,
              width: 24.h,
            ),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: SvgPicture.asset(
              AssetsManager.heart,
              height: 24.h,
              width: 24.h,
            ),
            activeIcon: SvgPicture.asset(
              AssetsManager.selectedHeart,
              height: 24.h,
              width: 24.h,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: SvgPicture.asset(
              AssetsManager.user,
              height: 24.h,
              width: 24.h,
            ),
            activeIcon: SvgPicture.asset(
              AssetsManager.selectedUser,
              height: 24.h,
              width: 24.h,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: ColorsManager.white, size: 50),
        onPressed: () {},
      ),
      body: tabs[selectedTap],
    );
  }
}



