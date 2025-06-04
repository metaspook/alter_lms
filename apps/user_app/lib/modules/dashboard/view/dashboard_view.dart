import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
import 'package:utils/utils.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        actionsPadding: AppThemes.actionsPadding,
        actions: [
          HaloAvatar(
            imageBuilder: Assets.images.user1.image,
            aspectRatioPercent: 90,
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 200, color: Colors.red),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(appSpacing),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5
              ),
              itemCount: _buildGridMenus().length,
              itemBuilder: (context, index) {
                return GridTile(
                  header: GridTileBar(
                    title: SvgPicture.asset(
                      _buildGridMenus()[index].imageName!,
                    ),
                  ),
                  child: Text(_buildGridMenus()[index].key)
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<Menu> _buildGridMenus() {
  return [
    Menu(id: uuid(), key: 'course', imageName: Assets.icons.shop),
    Menu(id: uuid(), key: 'course', imageName: Assets.icons.courses),
    Menu(id: uuid(), key: 'course', imageName: Assets.icons.courses),
    Menu(id: uuid(), key: 'course', imageName: Assets.icons.courses),
    Menu(id: uuid(), key: 'course', imageName: Assets.icons.courses),
  ];
  
}
