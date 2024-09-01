import 'package:flutter/material.dart';

class ButtonMenuSection extends StatelessWidget {
  final IconData icon;
  final String route;
  final String label;
  final Color color;
  final Widget widgetComp;

  const ButtonMenuSection({
    required this.icon,
    required this.route,
    required this.label,
    required this.color,
    required this.widgetComp,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => widgetComp,
          ),
        );
        ;
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adicionar um ícone que se relacione com atividades
            Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
