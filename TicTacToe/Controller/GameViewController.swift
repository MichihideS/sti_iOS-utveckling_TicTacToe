//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Michihide Sugito on 2024-09-04.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var playBoard: [UIImageView]!
    @IBOutlet weak var lblPlayerOne: UILabel!
    @IBOutlet weak var lblPlayerTwo: UILabel!
    @IBOutlet weak var lblPlayerOneName: UILabel!
    @IBOutlet weak var lblPlayerTwoName: UILabel!
    @IBOutlet weak var lblWhosTurn: UILabel!
    @IBOutlet weak var imgComputerPlaying: UIImageView!
    
    var game = Game()
    var isComputer = false
    var playerOneScore = 0
    var playerTwoScore = 0
    var playerOneName: String? = nil
    var playerTwoName: String? = nil
    var whosPlaying = 0
    var winner = 0
    let PLAYER_ONE = 1
    let PLAYER_TWO = 2
    let DRAW = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblPlayerOneName.text = playerOneName ?? "Player One"
        lblPlayerTwoName.text = playerTwoName ?? "Player Two"
        lblPlayerOne.text = "Wins: \(playerOneScore)"
        lblPlayerTwo.text = "Wins: \(playerTwoScore)"
        
        if isComputer {
            game.enableComputer(computerPlays: isComputer)
        }
        
        preGame()
    }

    // Action which all squares in the board points to.
    @IBAction func onPressedSquare(_ sender: UITapGestureRecognizer) {
        if let pressed = sender.view as? UIImageView {
       
            /* Checks if the square pressed is a free square and depending on the value it will
             * mark the square with ethier a X or a O depending on which player it was.
             */
            let value = game.checkOption(square: pressed.tag)
            
            switch value {
            case 1:
                pressed.image = UIImage(named: "player_one")
                if !isComputer {
                    lblWhosTurn.text = "\(playerTwoName ?? "Player Two")s turn"
                }
            case 2:
                pressed.image = UIImage(named: "player_two")
                if !isComputer {
                    lblWhosTurn.text = "\(playerOneName ?? "Player One")s turn"
                }
            default:
                break
            }
            
            // Checks for a winner before using the computer randomized move before and after
            winner = game.checkWinner()
            winnerFound()
            
            if isComputer && winner == 0 {
                imgComputerPlaying.isHidden = false
                
                boardDisabler()
                
                // GCD - computer makes the move 2 seconds after you make yours.
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    let computerValue = self.game.computerChoice()
                    
                    self.boardEnabler()
                    self.imgComputerPlaying.isHidden = true
                    
                    self.playBoard[computerValue].image = UIImage(named: "player_two")
                    self.winner = self.game.checkWinner()
                    self.winnerFound()
                }
            }
        }
    }
    
    // A prepare that will transfer the winner to the end screen.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? EndScreenViewController {
            switch winner {
            case 1:
                destinationVC.whoWon = playerOneName
            case 2:
                destinationVC.whoWon = playerTwoName
            case 3:
                destinationVC.whoWon = "DRAW"
            default:
                break
            }
        }
    }
    
    /* Checks which players are playing the game and calls the whoStarts function to see which player
     * gets to play first. If vs the computer you always go first.
     */
    func preGame() {
        if !isComputer {
            whosPlaying = game.whoStarts()
            if whosPlaying == PLAYER_ONE {
                lblWhosTurn.text = "\(playerOneName ?? "Player One")s turn"
            }
            
            if whosPlaying == PLAYER_TWO {
                lblWhosTurn.text = "\(playerTwoName ?? "Player Two")s turn"
            }
        } else {
            lblWhosTurn.text = "\(playerOneName ?? "Player One")s turn"
        }
    }
    
    /* Will loop through all the squares and reset the values.
     * Also updates the score depending on who wins.
    */
    func checkForWinner() {
        for board in playBoard {
            board.image = UIImage(named: "square")
        }
        
        if winner == PLAYER_ONE {
            playerOneScore += 1
            lblPlayerOne.text = "Wins: \(playerOneScore)"
        } else if winner == PLAYER_TWO {
            playerTwoScore += 1
            lblPlayerTwo.text = "Wins: \(playerTwoScore)"
        }
        
    }
    
    /* Checks if a winner has been found and if it has, it will loop through all the squares and reset the values.
     * Also updates the score depending on who wins.
     */
    func winnerFound() {
        if winner == PLAYER_ONE || winner == PLAYER_TWO || winner == DRAW {
            checkForWinner()
            
            // Resets the values of the array to 0
            game.reset()
            
            // If you are playing vs another player it will randomize again who will begind the round.
            preGame()
            
            // Navigation to the end screen if a winner is found.
            performSegue(withIdentifier: "segueToEndScreen", sender: self)
        }
    }
    
    // Disables interaction with the playboard.
    func boardDisabler() {
        for board in playBoard {
            board.isUserInteractionEnabled = false
        }
    }
    
    // Enables interaction with the playboard.
    func boardEnabler() {
        for board in playBoard {
            board.isUserInteractionEnabled = true
        }
    }
}
