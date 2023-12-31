import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/data/colors.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem({required IconData icon, required String label, required Function onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: GoogleFonts.robotoCondensed(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: ColorsProject.cerulean,
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: const Text(
                'Vamos Cozinhar?',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _createItem(icon: Icons.restaurant, label: 'Refeições', onTap: () {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }),
          _createItem(icon: Icons.settings, label: 'Configurações', onTap: () {
            Navigator.pushNamed(context, AppRoutes.settings);
          }),
        ],
      ),
    );
  }
}
