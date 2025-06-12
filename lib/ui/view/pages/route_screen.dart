import 'package:flutter/material.dart';
import 'package:icecream_crud_app/ui/view/widgets/data_list_view.dart';
import 'package:icecream_crud_app/ui/viewmodel/route_view_model.dart';
import 'package:provider/provider.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';

class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RouteViewModel>().loadRoutes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RouteViewModel>();

    return DataListView<RouteModel>(
      title: 'Rotas',
      items: viewModel.routes,
      getTitle: (item) => item.routeName,
      getSubtitle: (item) => '',
      onAddPressed: () {
        _showAddRouteDialog(context);
      },
      onDeletePressed: (index) async {
        final route = viewModel.routes[index];
        if (!viewModel.canDeleteRoute(route)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Não é possível excluir a rota "${route.routeName}" pois existem clientes associados a ela.',
              ),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
          return;
        }

        await viewModel.deleteRoute(route.id);
      },
    );
  }

  void _showAddRouteDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Rota'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome da Rota',
                  hintText: 'Ex: Piripiri, Brasileira, Piracuruca',
                ),
                textCapitalization: TextCapitalization.words,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                final routeName = nameController.text.trim();
                if (routeName.isNotEmpty) {
                  final route = RouteModel()..routeName = routeName;
                  context.read<RouteViewModel>().addRoute(route);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Rota "$routeName" adicionada com sucesso!',
                        ),
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                      ),
                    );
                  }

                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, insira o nome da rota.'),
                    ),
                  );
                }
              },
              child: const Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
