import 'package:flutter/material.dart';

class DataListView<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final String Function(T) getTitle;
  final String Function(T) getSubtitle;
  final VoidCallback onAddPressed;
  final Future<void> Function(int) onDeletePressed;

  const DataListView({
    Key? key,
    required this.title,
    required this.items,
    required this.getTitle,
    required this.getSubtitle,
    required this.onAddPressed,
    required this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(getTitle(item)),
                subtitle: Text(getSubtitle(item)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => onDeletePressed(index),
                ),
                onTap: () {
                  // Handle item tap for editing if necessary
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0), // Espaçamento em torno do botão
          child: Align(
            alignment: Alignment.bottomRight, // Posiciona o botão à direita
            child: FloatingActionButton(
              onPressed: onAddPressed,
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ],
    );
  }
}
