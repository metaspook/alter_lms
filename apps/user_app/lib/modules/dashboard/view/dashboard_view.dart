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
              ),
              itemCount: _buildGridMenus().length,
              itemBuilder: (context, index) {
                return GridTile(
                  header: GridTileBar(
                    title: Text(_buildGridMenus()[index].key),
                  ),
                  child: Image.asset(_buildGridMenus()[index].imageName!),
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
    Menu(id: uuid(), key: 'course', imageName: Assets.images.user1.keyName),
    Menu(id: uuid(), key: 'course', imageName: Assets.images.user1.keyName),
    Menu(id: uuid(), key: 'course', imageName: Assets.images.user1.keyName),
    Menu(id: uuid(), key: 'course', imageName: Assets.images.user1.keyName),
    Menu(id: uuid(), key: 'course', imageName: Assets.images.user1.keyName),
  ];
  
}
