import 'package:flutter/material.dart';

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EquipmentScreen()),
            );
          },
          child: const Text('Ir para Equipamentos'),
        ),
      ),
    );
  }
}

class EquipmentScreen extends StatefulWidget {
  const EquipmentScreen({Key? key}) : super(key: key);

  @override
  _EquipmentScreenState createState() => _EquipmentScreenState();
}

class _EquipmentScreenState extends State<EquipmentScreen> {
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
        title: const Text('Equipamentos'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Icon(
              Icons.computer,
              size: 100,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Busque por equipamento',
                border: InputBorder.none,
                filled: true,
                fillColor: Color(0xFF0073BC).withOpacity(0.28),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
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
                        children: const [
                          Text(
                            'Empresa',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Remaza'),
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
                children: const [
                  Text(
                    'Filial',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Daitan Ipiranga'),
                ],
              ),
              IconButton(
                icon: Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
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
                color:
                    const Color.fromARGB(255, 52, 151, 233), // Fundo azul claro
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                children: [
                  EquipmentTile(
                    equipmentName: 'Dell Inspirion 15',
                    patrimonio: 'Partimonio: 0001',
                  ),
                  EquipmentTile(
                    equipmentName: 'Dell Inspirion 15',
                    patrimonio: 'Partimonio: 0001',
                  ),
                  EquipmentTile(
                    equipmentName: 'Dell Inspirion 15',
                    patrimonio: 'Partimonio: 0001',
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class EquipmentTile extends StatelessWidget {
  final String equipmentName;
  final String patrimonio;

  const EquipmentTile({required this.equipmentName, required this.patrimonio});

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
            equipmentName,
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
