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
            checkWinner()
        } else {
            print("already used")
            print(boardArray)
        }
    }
    
    /* Checks for all possible winning conditions for the tic tac toe and loops through the conditions to see if any player
    ** have reached any of the combinations to win */
    func checkWinner() {
        let winningCondition: Array<[Int]> = [
            [boardArray[3], boardArray[4], boardArray[5]],
            [boardArray[0], boardArray[1], boardArray[2]],
            [boardArray[6], boardArray[7], boardArray[8]],
            [boardArray[0], boardArray[3], boardArray[6]],
            [boardArray[1], boardArray[4], boardArray[7]],
            [boardArray[2], boardArray[5], boardArray[8]],
            [boardArray[0], boardArray[4], boardArray[8]],
            [boardArray[2], boardArray[4], boardArray[6]]
        ]
        
        for condition in winningCondition {
            if condition == [1, 1, 1] {
                print("you won")
                reset()
                break
            }
            
            if condition == [2, 2, 2] {
                print("you lose")
                reset()
                break
            }
            print("test loop")
        }
    }
    
    func reset() {
        boardArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        print("resetted")
        
    }
}
