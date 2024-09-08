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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onPressedSquare(_ sender: UITapGestureRecognizer) {
        if let pressed = sender.view as? UIImageView {
            game.play(square: pressed.tag)
        }
    }
}
