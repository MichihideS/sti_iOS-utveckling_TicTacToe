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
    
    var game = Game()
    var computerPlays = false
    var playerOneScore = 0
    var playerTwoScore = 0
    var playerOneName: String? = nil
    var playerTwoName: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblPlayerOneName.text = playerOneName ?? "Player One"
        lblPlayerTwoName.text = playerTwoName ?? "Player Two"
        lblPlayerOne.text = "Wins: \(playerOneScore)"
        lblPlayerTwo.text = "Wins: \(playerTwoScore)"
    }

    @IBAction func onPressedSquare(_ sender: UITapGestureRecognizer) {
        if let pressed = sender.view as? UIImageView {
            if computerPlays {
                game.enableComputer(computerPlays: computerPlays)
            }
            
            let value = game.checkOption(square: pressed.tag)
            
            switch value {
            case 1:
                pressed.image = UIImage(named: "player_one")
            case 2:
                pressed.image = UIImage(named: "player_two")
            default:
                break
            }
            
            var winner = game.checkWinner()
            
            if computerPlays && winner == 0 {
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
            }
        }
    }
}
