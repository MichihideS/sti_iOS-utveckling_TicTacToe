//
//  SettingsPVCViewController.swift
//  TicTacToe
//
//  Created by Michihide Sugito on 2024-09-14.
//

import UIKit

class SettingsPVCViewController: UIViewController {
    @IBOutlet weak var txtPlayerOneName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /* Contains the information for the name the player chooses, computer name and a boolean
    ** so that the game knows the you want to play vs the computer.
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? GameViewController {
            let playerOne = txtPlayerOneName.text
            let playerTwo = "Computer"
            destinationVC.playerOneName = playerOne
            destinationVC.playerTwoName = playerTwo
            destinationVC.computerPlays = true
        }
    }
}
