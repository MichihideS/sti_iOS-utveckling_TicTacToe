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
        
        checkWinnerPlayerOne()
    }
    
    func checkWinnerPlayerOne() {
        switch boardArray {
            case [1, 1, 1, 0, 0, 0, 0, 0, 0]:
                print("you won")
            case [0, 0, 0, 1, 1, 1, 0, 0, 0]:
                print("you won")
            case [0, 0, 0, 0, 0, 0, 1, 1, 1]:
                print("won")
            case [1, 0, 0, 1, 0, 0, 1, 0, 0]:
                print("won")
            case [0, 1, 0, 0, 1, 0, 0, 1, 0]:
                print("won")
            case [0, 0, 1, 0, 0, 1, 0, 0, 1]:
                print("won")
            case [1, 0, 0, 0, 1, 0, 0, 0, 1]:
                print("won")
            case [0, 0, 1, 0, 1, 0, 1, 0, 0]:
                print("won")
            default:
                return
        }
    }
    
    func checkWinnerPlayerTwo() {
        switch boardArray {
            case [2, 2, 2, 0, 0, 0, 0, 0, 0]:
                print("lose")
            case [0, 0, 0, 2, 2, 2, 0, 0, 0]:
                print("lose")
            case [0, 0, 0, 0, 0, 0, 2, 2, 2]:
                print("lose")
            case [2, 0, 0, 2, 0, 0, 2, 0, 0]:
                print("lose")
            case [0, 2, 0, 0, 2, 0, 0, 2, 0]:
                print("lose")
            case [0, 0, 2, 0, 0, 2, 0, 0, 2]:
                print("lose")
            case [2, 0, 0, 0, 2, 0, 0, 0, 2]:
                print("lose")
            case [0, 0, 2, 0, 2, 0, 2, 0, 0]:
                print("lose")
            default:
                return
        }
    }
}
