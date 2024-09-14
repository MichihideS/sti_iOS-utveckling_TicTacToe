//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Michihide Sugito on 2024-09-04.
//

import UIKit

class GameViewController: UIViewController {
    @IBOutlet var playBoard: [UIImageView]!
    
    var game = Game()
    var whosTurn: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onPressedSquare(_ sender: UITapGestureRecognizer) {
        if let pressed = sender.view as? UIImageView {
            
            let value = game.checkOption(square: pressed.tag)
            print(value)
            
            switch value {
            case 1:
                pressed.image = UIImage(named: "ellipse")
            case 2:
                pressed.image = UIImage(named: "cancel")
            default:
                break
            }
            
            
        }
    }
}
