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
    
    var game = Game()
    var isComputer = false
    var playerOneScore = 0
    var playerTwoScore = 0
    var playerOneName: String? = nil
    var playerTwoName: String? = nil
    var whosPlaying = 0
    var winner = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblPlayerOneName.text = playerOneName ?? "Player One"
        lblPlayerTwoName.text = playerTwoName ?? "Player Two"
        lblPlayerOne.text = "Wins: \(playerOneScore)"
        lblPlayerTwo.text = "Wins: \(playerTwoScore)"
        
        if !isComputer {
            whosPlaying = game.whoStarts()
            if whosPlaying == 1 {
                lblWhosTurn.text = "\(playerOneName ?? "Player One")s turn"
            }
            
            if whosPlaying == 2 {
                lblWhosTurn.text = "\(playerTwoName ?? "Player Two")s turn"
            }
        } else {
            lblWhosTurn.text = "\(playerOneName ?? "Player One")s turn"
        }
    }

    @IBAction func onPressedSquare(_ sender: UITapGestureRecognizer) {
        if let pressed = sender.view as? UIImageView {
            if isComputer {
                game.enableComputer(computerPlays: isComputer)
            }
            
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
            
            winner = game.checkWinner()
            
            if isComputer && winner == 0 {
                
                let computerValue = game.computerChoice()
                
                playBoard[computerValue].image = UIImage(named: "player_two")
                winner = game.checkWinner()
            }
            print(value)
       
            if winner == 1 || winner == 2 || winner == 3 {
                for board in playBoard {
                    board.image = UIImage(named: "square")
                }
                
                if winner == 1 {
                    playerOneScore += 1
                    lblPlayerOne.text = "Wins: \(playerOneScore)"
                } else if winner == 2 {
                    playerTwoScore += 1
                    lblPlayerTwo.text = "Wins: \(playerTwoScore)"
                }
                
                game.reset()
                
                if !isComputer {
                    whosPlaying = game.whoStarts()
                    if whosPlaying == 1 {
                        lblWhosTurn.text = "\(playerOneName ?? "Player One")s turn"
                    }
                    
                    if whosPlaying == 2 {
                        lblWhosTurn.text = "\(playerTwoName ?? "Player Two")s turn"
                    }
                }
                
                performSegue(withIdentifier: "segueToEndScreen", sender: self)
            }
        }
    }
    
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
}
