import 'package:flutter/material.dart';
import 'package:icecream_crud_app/ui/view/widgets/data_list_view.dart';
import 'package:icecream_crud_app/ui/viewmodel/customer_view_model.dart';
import 'package:icecream_crud_app/ui/viewmodel/route_view_model.dart';
import 'package:provider/provider.dart';
import 'package:icecream_crud_app/data/models/customer_model.dart';
import 'package:icecream_crud_app/data/models/route_model.dart';

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  State<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = context.read<CustomerViewModel>();
      viewModel.loadCustomers();
      viewModel.loadRoutes(); // Garantir que as rotas sejam carregadas
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CustomerViewModel>();
    if (viewModel.isLoading && viewModel.customers.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return DataListView<CustomerModel>(
      title: 'Clientes',
      items: viewModel.customers,
      getTitle: (item) => item.customerName,
      getSubtitle: (item) => item.route.value != null
          ? 'Rota: ${item.route.value!.routeName}'
          : 'Sem rota definida',
      onAddPressed: () {
        if (viewModel.routes.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Cadastre pelo menos uma rota antes de adicionar clientes.',
              ),
              duration: Duration(seconds: 3),
            ),
          );
          return;
        }
        _showAddCustomerDialog(context);
      },
      onDeletePressed: (index) async {
        final customer = viewModel.customers[index];
        await viewModel.deleteCustomer(customer.id);
      },
    );
  }

  void _showAddCustomerDialog(BuildContext context) {
    final viewModel = context.read<CustomerViewModel>();
    final TextEditingController nameController = TextEditingController();
    RouteModel? selectedRoute;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text('Adicionar Cliente'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome do Cliente',
                      hintText: 'Digite o nome do cliente',
                    ),
                    textCapitalization: TextCapitalization.words,
                    autofocus: true,
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<RouteModel?>(
                    decoration: const InputDecoration(
                      labelText: 'Selecione a Rota',
                      helperText: 'Escolha a rota deste cliente',
                    ),
                    value: selectedRoute,
                    items: viewModel.routes.map((route) {
                      return DropdownMenuItem(
                        value: route,
                        child: Text(route.routeName),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedRoute = value;
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Por favor, selecione uma rota';
                      }
                      return null;
                    },
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
                  onPressed: () async {
                    final customerName = nameController.text.trim();
                    if (customerName.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, insira o nome do cliente.'),
                        ),
                      );
                      return;
                    }

                    if (selectedRoute == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, selecione uma rota.'),
                        ),
                      );
                      return;
                    }
                    final customer = CustomerModel()
                      ..customerName = customerName;

                    Navigator.pop(context);
                    await viewModel.addCustomer(customer, selectedRoute);
                    await context.read<RouteViewModel>().loadRoutes();
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Cliente "$customerName" adicionado com sucesso!',
                          ),
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.tertiary,
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
      },
    );
  }
}
