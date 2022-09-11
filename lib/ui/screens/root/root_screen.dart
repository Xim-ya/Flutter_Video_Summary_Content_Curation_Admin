import 'package:video_curation_admin/utils/index.dart';

class RootScreen extends BaseScreen<RootViewModel> {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            selectedIndex: vm.selectedIndex,
            groupAlignment: vm.groupAligment,
            onDestinationSelected: (int index) {
              // setState(() {
              //   _selectedIndex = index;
              // });
            },
            labelType: vm.labelType,
            leading: vm.showLeading
                ? FloatingActionButton(
                    elevation: 0,
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    child: const Icon(Icons.add),
                  )
                : const SizedBox(),
            trailing: vm.showTrailing
                ? IconButton(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    icon: const Icon(Icons.more_horiz_rounded),
                  )
                : const SizedBox(),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(Icons.star),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // This is the main content.
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
