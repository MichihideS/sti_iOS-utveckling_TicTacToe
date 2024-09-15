//
//  EndScreenViewController.swift
//  TicTacToe
//
//  Created by Michihide Sugito on 2024-09-15.
//

import UIKit

class EndScreenViewController: UIViewController {
    @IBOutlet weak var lblwhoWon: UILabel!
    
    var whoWon: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if whoWon == "DRAW" {
            lblwhoWon.text = "DRAW, try again!"
        } else {
            lblwhoWon.text = "\(whoWon ?? "Player") WINS"
        }
    }
    
    @IBAction func btnPlayAgain(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        }
    }
    
    @IBAction func btnMainMenu(_ sender: UIButton) {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
