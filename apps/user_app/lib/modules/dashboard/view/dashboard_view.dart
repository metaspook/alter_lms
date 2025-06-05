import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';
import 'package:utils/utils.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
              padding: const EdgeInsets.all(appSpacing * 2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: appSpacing * 1.5,
                mainAxisSpacing: appSpacing * 1.5,
                // childAspectRatio: 2,
                mainAxisExtent: 75
              ),
              itemCount: _buildGridMenus().length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: appSpacing),
                    child: Column(
                      spacing: appSpacing * .25,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: SvgPicture.asset(
                            _buildGridMenus()[index].imageName!,
                          ),
                        ),
                        Text(l10n.resolve(_buildGridMenus()[index].key)),
                      ],
                    ),
                  ),
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
    Menu(id: uuid(), key: 'liveClass', imageName: Assets.icons.shop),
    Menu(id: uuid(), key: 'shop', imageName: Assets.icons.courses),
    Menu(id: uuid(), key: 'courses', imageName: Assets.icons.courses),
    Menu(id: uuid(), key: 'students', imageName: Assets.icons.courses),
    Menu(id: uuid(), key: 'groups', imageName: Assets.icons.courses),
    Menu(id: uuid(), key: 'signOut', imageName: Assets.icons.courses),
  ];
  
}
