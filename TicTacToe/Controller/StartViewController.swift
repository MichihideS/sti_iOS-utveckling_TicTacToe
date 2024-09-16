//
//  ViewController.swift
//  TicTacToe
//
//  Created by Michihide Sugito on 2024-09-04.
//

import UIKit

class StartViewController: UIViewController {
    @IBOutlet weak var imgX: UIImageView!
    @IBOutlet weak var imgXTwo: UIImageView!
    @IBOutlet weak var imgXThree: UIImageView!
    @IBOutlet weak var imgO: UIImageView!
    @IBOutlet weak var imgOTwo: UIImageView!
    @IBOutlet weak var imgOThree: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Looping timer to make the animations go infinite when the start screen loads
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            UIView.animate(withDuration: 0.1) {
                self.imgX.transform = self.imgX.transform.rotated(by: 0.5)
                self.imgXTwo.transform = self.imgXTwo.transform.rotated(by: 0.2)
                self.imgXThree.transform = self.imgXThree.transform.rotated(by: 0.35)
                self.imgO.center.y += 5
                self.imgO.center.x += 2
                self.imgOTwo.center.y -= 6
                self.imgOTwo.center.x += 3
            }
        }
        
        // Looping timer that loops back aswell to make the animation go back and forth
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
            UIView.animate(withDuration: 1, animations: {
                self.imgOThree.center.x -= 400
            }) { completed in
                if completed {
                    UIView.animate(withDuration: 2, animations: {
                        self.imgOThree.center.x += 400
                    })
                }
            }
        }
    }
}

