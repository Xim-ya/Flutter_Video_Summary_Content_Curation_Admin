import 'package:video_curation_admin/ui/screens/channel/channel_screen.dart';
import 'package:video_curation_admin/utils/index.dart';

class TabsScreen extends BaseScreen<TabsViewModel> {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    List<Widget> routeScreenList = [
      const ChannelScreen(),
      Container(),
      Container()
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: <Widget>[
          Obx(
            () => NavigationRail(
              selectedIndex: vm.selectedIndex.value,
              groupAlignment: vm.groupAligment,
              onDestinationSelected: (int index) => vm.onNavItemTapped(index),
              labelType: NavigationRailLabelType.selected,
              destinations: const <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite),
                  label: Text('Channel'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.bookmark_border),
                  selectedIcon: Icon(Icons.book),
                  label: Text('Contents'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.star_border),
                  selectedIcon: Icon(Icons.star),
                  label: Text('User'),
                ),
              ],
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Obx(
            () => Expanded(
              child: routeScreenList[vm.selectedIndex.value],
            ),
          ),
        ],
      ),
    );
  }
}
