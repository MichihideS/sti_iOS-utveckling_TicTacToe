//
//  Game.swift
//  TicTacToe
//
//  Created by Michihide Sugito on 2024-09-08.
//

import Foundation

class Game {
    var boardArray: Array<Int> = [0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0]
    var whosTurn: Int?
    
    // Randomizes which player will start the in the TicTacToe
    func whoStarts() {
        let randomNumber = Int.random(in: 1...2)
        whosTurn = randomNumber
    }
    
    /* Checks if the square is taken by checking the tag and the value of the square, if the value is 0 the new value becomes the
    ** value of the player and its the next players turn.
     */
    func checkOption(square: Int) -> Int {
        if whosTurn == nil {
            whoStarts()
        }
        var imageValue = 0
        
        switch boardArray[square] {
        case 0:
            if whosTurn == 1 {
                boardArray[square] = 1
                whosTurn = 2
                imageValue = 1
            } else if whosTurn == 2 {
                boardArray[square] = 2
                whosTurn = 1
                imageValue = 2
            }
        default:
            print("already used")
            print(boardArray)
            imageValue = 666
            break
        }
        print(boardArray[square])
        return imageValue
    }
    
    /* Checks for all possible winning conditions for the tic tac toe and loops through the conditions to see if any player
    ** have reached any of the combinations to win. */
    func checkWinner() -> Bool {
        var isWinnerYet = false
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
                isWinnerYet = true
                print("you won")
                reset()
                break
            }
            
            if condition == [2, 2, 2] {
                isWinnerYet = true
                print("you lose")
                reset()
                break
            }
           // print("test loop")
        }
        
        return isWinnerYet
    }
    
    // Resets the TicTacToe board to a value of 0s.
    func reset() {
        boardArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        whosTurn = nil
        print("resetted")
        
    }
}
