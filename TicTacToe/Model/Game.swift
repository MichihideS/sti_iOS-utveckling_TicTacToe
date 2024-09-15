//
//  Game.swift
//  TicTacToe
//
//  Created by Michihide Sugito on 2024-09-08.
//

import Foundation

class Game {
    var boardArray: Array<Int> = [0, 0 ,0 ,0 ,0 ,0 ,0 ,0 ,0]
    var whosPlaying = 0
    var isComputer = false
    var computerSquare = 0
    var isPlayerDone = false
    let PLAYER_ONE = 1
    let PLAYER_TWO = 2
    let DRAW = 3
    
    // Enables computer mode.
    func enableComputer(computerPlays: Bool) {
        isComputer = computerPlays
    }
    
    // Randomizes which player will start the in the TicTacToe (Not vs the computer) and returns the value.
    func whoStarts() -> Int {
        let randomNumber = Int.random(in: 1...2)
        whosPlaying = randomNumber
        
        return whosPlaying
    }
    
    /* Checks Boolean if player actually made a valid choice and if player did computer will randomize a number and
     * check the array if the number is valid aswell.
     */
    func computerChoice() -> Int {
        if isPlayerDone {
            repeat {
                let randomNumber = Int.random(in: 0...8)
                computerSquare = randomNumber
            } while boardArray[computerSquare] != 0
            
            boardArray[computerSquare] = PLAYER_TWO
            isPlayerDone = false
        }
        
        return computerSquare
    }
    
    /* Checks if the square is taken by checking the tag and the value of the square, if the value is 0 the new value becomes the
     * value of the player and its the next players turn. If you are playing vs the computer player one will always be the player
     * since the computer will act as soon as the player act. Function returns a value that shows which player just acted.
     */
    func checkOption(square: Int) -> Int {
        if isComputer {
            whosPlaying = PLAYER_ONE
        }
        var imageValue = 0
        
        switch boardArray[square] {
        case 0:
            if whosPlaying == PLAYER_ONE {
                boardArray[square] = PLAYER_ONE
                if !isComputer {
                    whosPlaying = PLAYER_TWO
                } else {
                    isPlayerDone = true
                }
                imageValue = 1
            } else if whosPlaying == PLAYER_TWO {
                boardArray[square] = PLAYER_TWO
                whosPlaying = PLAYER_ONE
                imageValue = 2
            }
        default:
            imageValue = 666
            break
        }
        return imageValue
    }
    
    /* Checks for all possible winning conditions for the tic tac toe and loops through the conditions to see if any player
     * have reached any of the combinations to win. Also checks if all squares are taken and if no winner has yet to be declared
     * it will return a draw.
     */
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
                isWinnerYet = PLAYER_ONE
                break
            } else if condition == [2, 2, 2] {
                isWinnerYet = PLAYER_TWO
                break
            }
        }
        
        if !boardArray.contains(0) && isWinnerYet == 0 {
            isWinnerYet = DRAW
        }
        
        return isWinnerYet
    }
    
    // Resets the TicTacToe board to a value of 0s.
    func reset() {
        boardArray = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
}
