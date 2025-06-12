import 'package:flutter/material.dart';
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
    // Carregar produtos ao iniciar a tela
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductViewModel>().loadProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            // AppBar já configurada na HomeScreen
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Produtos',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall, // Usando a tipografia do tema
              ),
            ),
            if (viewModel.isLoading)
              const Center(child: CircularProgressIndicator())
            else if (viewModel.error != null)
              Center(child: Text(viewModel.error!))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index) {
                    final product = viewModel.products[index];
                    return ListTile(
                      title: Text(product.productName),
                      subtitle: Text('R\$ ${product.unitValueInCents / 100}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          viewModel.deleteProduct(product.id);
                        },
                      ),
                      onTap: () {
                        // Ação de editar
                        _showEditProductDialog(context, product);
                      },
                    );
                  },
                ),
              ),
            // Floating action button com padding
            Padding(
              padding: const EdgeInsets.all(
                16.0,
              ), // Ajuste o valor do padding conforme necessário
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: () {
                    _showAddProductDialog(context);
                  },
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ],
        );
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

  void _showEditProductDialog(BuildContext context, ProductModel product) {
    final TextEditingController nameController = TextEditingController(
      text: product.productName,
    );
    final TextEditingController priceController = TextEditingController(
      text: (product.unitValueInCents / 100).toString(),
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Produto'),
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
                  product.productName = productName;
                  product.unitValueInCents =
                      unitValueInCents; // Atualizando o valor em centavos
                  context.read<ProductViewModel>().addProduct(
                    product,
                  ); // Atualiza o produto
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
