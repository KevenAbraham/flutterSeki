import 'package:flutter/material.dart';
import 'screens/company_screen.dart';
import 'screens/equipment_screen.dart'; // Importe a nova tela

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.business),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CompanyScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.computer),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EquipmentScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ícone de usuário centralizado
            const Center(
              child: Icon(
                Icons.person,
                size: 100,
              ),
            ),
            const SizedBox(height: 20),
            // Campo de busca
            TextField(
              decoration: InputDecoration(
                hintText: 'Busque por usuário',
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xFF0073BC).withOpacity(0.28),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                suffixIcon: const Icon(Icons.search),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Retângulo principal
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Empresa',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Remaza'),
                        ],
                      ),
                      IconButton(
                        icon: Icon(
                          isExpanded
                              ? Icons.arrow_drop_up
                              : Icons.arrow_drop_down,
                        ),
                        onPressed: toggleExpanded,
                      ),
                    ],
                  ),
                  if (isExpanded)
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ExpandableContainer(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableContainer extends StatefulWidget {
  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  bool isExpanded = false;

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Empresa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('Daitan'),
                ],
              ),
              IconButton(
                icon: Icon(
                  isExpanded
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                ),
                onPressed: toggleExpanded,
              ),
            ],
          ),
          if (isExpanded)
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 52, 151, 233), // Fundo azul claro
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  CompanyTile(companyName: 'Empresa 1'),
                  CompanyTile(companyName: 'Empresa 2'),
                  CompanyTile(companyName: 'Empresa 3'),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class CompanyTile extends StatelessWidget {
  final String companyName;

  const CompanyTile({required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Fundo branco
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            companyName,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.visibility, color: Colors.blue),
            onPressed: () {
              // Ação ao clicar no botão de visualizar
            },
          ),
        ],
      ),
    );
  }
}
