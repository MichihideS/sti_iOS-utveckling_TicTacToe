//
//  Game.swift
//  TicTacToe
//
//  Created by Michihide Sugito on 2024-09-08.
//

import Foundation

class Game {
    var boardArray: Array<Int> = [0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0]
    
    func checkOption(square: Int) {
        if boardArray[square] == 0 {
            boardArray[square] = 1
        } else {
            print("already used")
            print(boardArray)
        }
        
        checkWinner()
    }
    
    func checkWinner() {
        switch boardArray {
            case [1, 1, 1, 0, 0, 0, 0, 0, 0]:
            print("you won")
        default:
            return
        }
    }
}
