// ignore_for_file: prefer_const_constructors, unnecessary_brace_in_string_interps, dead_code, non_constant_identifier_names, unused_local_variable, unnecessary_string_interpolations

import 'package:chess/chessBoardFunctions.dart';
import 'package:flutter/material.dart';

class ChessBoard extends StatefulWidget {
  const ChessBoard({super.key});

  @override
  State<ChessBoard> createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {

  Piece piece = Piece(img: '') ;
  ChessBoardFunctions viewModel = ChessBoardFunctions();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Padding(
        padding: EdgeInsets.only(top: 150),
        child: 
        
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8), 
          itemCount: viewModel.boardPieces.isNotEmpty ? viewModel.boardPieces.length : 64,
          itemBuilder: (context, index) {
          
          int x = index ~/ 8;
          int y = index % 8;

          String Coordinate = viewModel.checkCoordinates((index + 1));

          if(!viewModel.gameStarted) {
            piece = viewModel.initiate(index);
            viewModel.boardPieces.addAll({Coordinate : piece});
            } else 
              {
                piece = Piece(img: '', icon: null, changes: []); 
                // viewModel.initiate(index);
                }

          Piece temp = viewModel.boardPieces['$Coordinate']!;  
          
          return temp.img!.isNotEmpty ?  
          Draggable<String>(
            data: '$Coordinate,${temp.img},$index',
            onDragCompleted: () {
              // setState(() {});
            },
            onDragEnd: (d) {
                setState(() {
                  viewModel.changeHandler();
                });
            },
            feedback: SizedBox(  
              height: 70,
              width: 70,
              child: Image(image: AssetImage(temp.img!)),
            ),
            child: Container(
              color: !((x + y) % 2 == 0) ?  Colors.black : Colors.white,
              height: 100,
              width: 100,
              child: 
              // Center(child: Text('${Coordinate}', style: TextStyle(color: Colors.blue[400])))
              Image(image: AssetImage(temp.img!))
              ),
          ) 
          : 
          DragTarget<String>(
                onWillAcceptWithDetails: (details) {
                     
                      viewModel.gameStarted = true;   
                      viewModel.changes = [details.data.toString().split(',')[0], Coordinate];
                      return true;
                },
                builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) { 
                  String img = '';
                  Color color = !((x + y) % 2 == 0) ?  Colors.black : Colors.white; 

                  if(candidateData.isNotEmpty) {}

                    return Container(   
                      height: 70,
                      width: 70,
                      color: color,
                      child: 
                      // Center(child: Text('${Coordinate}', style: TextStyle(color: Colors.blue[400])))
                      // img.isNotEmpty ? Image(image: AssetImage(img)): 
                      Container(color: color)
                    );
                  }
                 );  
        }), 
      ));
  }
}   


// List<List> coList = [ 
//      [57, 49, 41, 33, 25, 17, 9,  1, 'A'],
//      [58, 50, 42, 34, 26, 18, 10, 2, 'B'],
//      [59, 51, 43, 35, 27, 19, 11, 3, 'C'],
//      [60, 52, 44, 36, 28, 20, 12, 4, 'D'],
//      [61, 53, 45, 37, 29, 21, 13, 5, 'E'],
//      [62, 54, 46, 38, 30, 22, 14, 6, 'F'],  
//      [63, 55, 47, 39, 31, 23, 15, 7, 'G'],
//      [64, 56, 48, 40, 32, 24, 16, 8, 'H']
// ];
 
// List<int> A = [0,8,16,24,32,40,48,56];
// List<int> B = [1,9,17,25,33,41,49,57];
// List<int> C = [2,10,18,26,34,42,50,58];
// List<int> D = [3,11,19,27,35,43,51,59];
// List<int> E = [4,12,20,28,36,44,52,60];
// List<int> F = [5,13,21,29,37,45,53,61];
// List<int> G = [6,14,22,30,38,46,54,62];
// List<int> H = [7,15,23,31,39,47,55,63];

// List A = [0,8,16,24,32,40,48,56, 'A'];
// List B = [1,9,17,25,33,41,49,57, 'B'];
// List C = [2,10,18,26,34,42,50,58,'C'];
// List D = [3,11,19,27,35,43,51,59,'D'];
// List E = [4,12,20,28,36,44,52,60,'E'];
// List F = [5,13,21,29,37,45,53,61,'F'];
// List G = [6,14,22,30,38,46,54,62,'G'];
// List H = [7,15,23,31,39,47,55,63,'H'];

//     [1, 9, 17, 25, 33, 41, 49, 57, 'A'],
//     # [2, 10, 18, 26, 34, 42, 50, 58, 'B'],
//     [58, 50, 42, 34, 26, 18, 10, 2, 'B'],
//     # [3, 11, 19, 27, 35, 43, 51, 59, 'C'],
//     [59, 51, 43, 35, 27, 19, 11, 3, 'C'],
//     # [4, 12, 20, 28, 36, 44, 52, 60, 'D'],
//     [60, 52, 44, 36, 28, 20, 12, 4, 'D'],
//     # [5, 13, 21, 29, 37, 45, 53, 61, 'E'],
//     [61, 53, 45, 37, 29, 21, 13, 5, 'E'],
//     # [6, 14, 22, 30, 38, 46, 54, 62, 'F'],
//     [62, 54, 46, 38, 30, 22, 14, 6, 'F'],
//     # [7, 15, 23, 31, 39, 47, 55, 63, 'G'],
//     [63, 55, 47, 39, 31, 23, 15, 7, 'G'],
//     # [8, 16, 24, 32, 40, 48, 56, 64, 'H'],
//     [64, 56, 48, 40, 32, 24, 16, 8, 'H']
// ]

// List<List> coList = [
//  [0,8,16,24,32,40,48,56, 'A'],
//[ 57, 49, 41, 33, 25, 17, 9, 1, 'A'],
//  [1,9,17,25,33,41,49,57, 'B'],s
//  [2,10,18,26,34,42,50,58,'C'],
//  [3,11,19,27,35,43,51,59,'D'],
//  [4,12,20,28,36,44,52,60,'E'],
//  [5,13,21,29,37,45,53,61,'F'],
//  [6,14,22,30,38,46,54,62,'G'],
//  [7,15,23,31,39,47,55,63,'H'],
// ];