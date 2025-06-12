import 'package:flutter/material.dart';
import 'package:icecream_crud_app/ui/view/widgets/data_list_view.dart';
import 'package:icecream_crud_app/ui/viewmodel/product_view_model.dart';
import 'package:provider/provider.dart';
import 'package:icecream_crud_app/data/models/product_model.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductViewModel>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataListView<ProductModel>(
      title: 'Produtos',
      items: context.watch<ProductViewModel>().products,
      getTitle: (item) => item.productName,
      getSubtitle: (item) => 'R\$ ${item.unitValueInCents / 100}',
      onAddPressed: () {
        _showAddProductDialog(context);
      },
      onDeletePressed: (index) async {
        final product = context.read<ProductViewModel>().products[index];
        await context.read<ProductViewModel>().deleteProduct(product.id);
      },
    );
  }

  void _showAddProductDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController priceController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Adicionar Produto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nome do Produto'),
              ),
              TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: 'Preço (R\$)'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final productName = nameController.text;
                final priceInReais = double.tryParse(priceController.text) ?? 0;
                final unitValueInCents = (priceInReais * 100)
                    .toInt(); // Convertendo para centavos

                if (productName.isNotEmpty) {
                  final product = ProductModel()
                    ..productName = productName
                    ..unitValueInCents = unitValueInCents;
                  context.read<ProductViewModel>().addProduct(product);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Produto "$productName" adicionado com sucesso!',
                        ),
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                      ),
                    );
                  }

                  Navigator.pop(context);
                }
              },
              child: const Text('Salvar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
