//
//  SettingsPVPViewController.swift
//  TicTacToe
//
//  Created by Michihide Sugito on 2024-09-14.
//

import UIKit

class SettingsPVPViewController: UIViewController {
    @IBOutlet weak var txtPlayerOneName: UITextField!
    @IBOutlet weak var txtPlayerTwoName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? GameViewController {
            let playerOne = txtPlayerOneName.text
            let playerTwo = txtPlayerTwoName.text
            destinationVC.playerOneName = playerOne
            destinationVC.playerTwoName = playerTwo
            destinationVC.isComputer = false
        }
    }

}
