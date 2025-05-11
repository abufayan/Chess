// ignore_for_file: camel_case_types, constant_identifier_names, prefer_contains, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

enum ICONS  { 
  PAWN,
  ROOK,
  KNIGHT,
  BISHOP,
  QUEEN,
  KING,
  WHITEPAWN,
  WHITEKing,
  WHITEQUEEN,
  WHITEBISHOP,
  WHITEKNIGHT,
  WHITEROOK
}

class Piece {
  Piece({this.icon, this.color, this.changes, this.img});

  Icons? icon;
  String? color;
  String? img;
  List? changes = [];
}

class ChessBoardFunctions extends ChangeNotifier {

Map<String, Piece> boardPieces = {};
List<String> changes = [];
bool gameStarted = false;
Piece icon = Piece(img: '');
Piece? piece;
 
 changeHandler () {
  bool changedHappened = changes.isNotEmpty; 

  print('ChangeHappened : ${changes[0]} - ${changes[1]}');
    if(changedHappened) {
        String movedPiece = changes[0]; 
        String changedPlace = changes[1]; 
        print('changedPlace - ${boardPieces['${changedPlace}']!.img}');
        print('changedPlace - ${boardPieces['${movedPiece}']!.img}');
         
        if(boardPieces['${changedPlace}']!.img!.isEmpty) {
          boardPieces['${changedPlace}'] = boardPieces['${movedPiece}']!;
          boardPieces['${movedPiece}'] = Piece(img: ''); 
        } else {
          print('im - ${boardPieces['${changedPlace}']!.img}');
          changes = [];
        }
    }
}

Piece initiate (int index) {
  if(!gameStarted) {          
            if(index < 8) {
              index == 0 ? icon = Piece(img: 'assets/rook.png') : null;
              index == 1 ? icon = Piece(img: 'assets/knight.png') : null;
              index == 2 ? icon = Piece(img: 'assets/bishop.png') : null;
              index == 3 ? icon = Piece(img: 'assets/queen.png') : null;  
              index == 4 ? icon = Piece(img: 'assets/king.png') : null;
              index == 5 ? icon = Piece(img: 'assets/bishop.png') : null; 
              index == 6 ? icon = Piece(img: 'assets/knight.png') : null; 
              index == 7 ? icon = Piece(img: 'assets/rook.png') : null;
              }
              else if(index < 16 && index > 7) {
                icon = Piece(img: 'assets/pawn.png');
              } 
              else if(index >= 16 && index <= 47) { 
                icon = Piece(img: '');
              } 
              else if( index > 47 && index < 56) {
                icon = Piece(img: 'assets/WhitePawn.png');
              } 
              else if(index > 55) {
                index == 56 ? icon = Piece(img: 'assets/WhiteRook.png') : null;
                index == 57 ? icon = Piece(img: 'assets/Whiteknight.png') : null;
                index == 58 ? icon = Piece(img: 'assets/WhiteBishop.png') : null;
                index == 59 ? icon = Piece(img: 'assets/WhiteQueen.png') : null;
                index == 60 ? icon = Piece(img: 'assets/WhiteKing.png') : null;
                index == 61 ? icon = Piece(img: 'assets/WhiteBishop.png') : null;
                index == 62 ? icon = Piece(img: 'assets/Whiteknight.png') : null;
                index == 63 ? icon = Piece(img: 'assets/WhiteRook.png') : null;
              }

          } 
          else {}
  return icon;
}

List<List> coList = [ 
     [57, 49, 41, 33, 25, 17, 9,  1, 'A'],
     [58, 50, 42, 34, 26, 18, 10, 2, 'B'],
     [59, 51, 43, 35, 27, 19, 11, 3, 'C'],
     [60, 52, 44, 36, 28, 20, 12, 4, 'D'],
     [61, 53, 45, 37, 29, 21, 13, 5, 'E'],
     [62, 54, 46, 38, 30, 22, 14, 6, 'F'],  
     [63, 55, 47, 39, 31, 23, 15, 7, 'G'],
     [64, 56, 48, 40, 32, 24, 16, 8, 'H']
];


    String  checkCoordinates(int index) {
        String Coordinate = '';
        for (var ele in coList) {
          for (var e in ele) {
            e == index ? Coordinate += '${ele[8]}${(ele.indexOf(e) + 1).toString()}' : null ;
          }
        }
        return Coordinate;
      }
}