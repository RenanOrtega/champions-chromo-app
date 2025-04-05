import 'package:flutter/material.dart';

class StepIndicator extends StatelessWidget {
  final int number;
  final String title;
  final bool isActive;
  final bool isCompleted;

  const StepIndicator(
      {super.key,
      required this.number,
      required this.title,
      required this.isActive,
      required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80, // Aumentar a largura para acomodar textos mais longos
      child: Column(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.white : Colors.white.withOpacity(0.3),
            ),
            child: Center(
              child: isCompleted
                  ? const Icon(Icons.check, size: 18, color: Colors.blue)
                  : Text(
                      number.toString(),
                      style: TextStyle(
                        color: isActive ? Colors.blue : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            textAlign: TextAlign.center,
            softWrap: false, // Impede a quebra do texto
            overflow:
                TextOverflow.visible, // Permite que o texto ultrapasse o espaço
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
