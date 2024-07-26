import 'package:flutter/material.dart';
import 'package:flutter_application/blocs/puzzle_bloc.dart';
import 'package:flutter_application/blocs/puzzle_event.dart';
import 'package:flutter_application/blocs/puzzle_state.dart';
import 'package:flutter_application/ui/widgets/grid_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> numberList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '',
  ];

  List<List<String>> numbersGrid = [];

  @override
  void initState() {
    super.initState();
    numberList.shuffle();
    _createGrid();
  }

  void _createGrid() {
    int size = 4;
    for (int i = 0; i < size; i++) {
      List<String> subList = [];
      for (int j = 0; j < 4; j++) {
        subList.add(numberList[i * size + j]);
      }
      numbersGrid.add(subList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "15 Puzzle game",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Expanded(
              child: BlocBuilder<PuzzleBloc, PuzzleState>(
                builder: (context, state) {
                  if (state is PuzzleUpdatedState) {
                    numbersGrid = state.grid;
                  }

                  return GridView.builder(
                    itemCount: numberList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      int row = index ~/ 4;
                      int col = index % 4;
                      return InkWell(
                        onTap: () {
                          BlocProvider.of<PuzzleBloc>(context)
                              .add(OnPressedEvent(
                            row: row,
                            col: col,
                          ));
                        },
                        child: NumberWidget(number: numbersGrid[row][col]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
