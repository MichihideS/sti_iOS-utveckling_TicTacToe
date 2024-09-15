//
//  Game.swift
//  TicTacToe
//
//  Created by Michihide Sugito on 2024-09-08.
//

import Foundation

class Game {
    var boardArray: Array<Int> = [0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0]
    var whosPlaying: Int?
    var isComputer = false
    var computerSquare = 0
    var isPlayerDone = false
    
    // Enables computer mode.
    func enableComputer(computerPlays: Bool) {
        isComputer = computerPlays
    }
    // Randomizes which player will start the in the TicTacToe.
    func whoStarts() {
        let randomNumber = Int.random(in: 1...2)
        whosPlaying = randomNumber
    }
    
    /* Checks Boolean if player actually made a valid choice and if player did computer will randomize a number and
    ** check the array if the number is valid aswell.
     */
    func computerChoice() -> Int {
        if isPlayerDone {
            repeat {
                let randomNumber = Int.random(in: 0...8)
                computerSquare = randomNumber
            } while boardArray[computerSquare] != 0
            
            boardArray[computerSquare] = 2
            isPlayerDone = false
        }
        
        return computerSquare
    }
    
    /* Checks if the square is taken by checking the tag and the value of the square, if the value is 0 the new value becomes the
    ** value of the player and its the next players turn.
     */
    func checkOption(square: Int) -> Int {
        if whosPlaying == nil && !isComputer {
            whoStarts()
        } else {
            whosPlaying = 1
        }
        var imageValue = 0
        
        switch boardArray[square] {
        case 0:
            if whosPlaying == 1 {
                boardArray[square] = 1
                if !isComputer {
                    whosPlaying = 2
                } else {
                    isPlayerDone = true
                }
                imageValue = 1
            } else if whosPlaying == 2 {
                boardArray[square] = 2
                whosPlaying = 1
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
    func checkWinner() -> Int {
        var isWinnerYet = 0
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
                isWinnerYet = 1
                print("Player One Won")
                reset()
                break
            } else if condition == [2, 2, 2] {
                isWinnerYet = 2
                print("Player Two Won")
                reset()
                break
            }
        }
        
        if !boardArray.contains(0) {
            isWinnerYet = 3
            reset()
        }
        
        return isWinnerYet
    }
    
    // Resets the TicTacToe board to a value of 0s.
    func reset() {
        boardArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        whosPlaying = nil
        print("resetted")
        
    }
}
