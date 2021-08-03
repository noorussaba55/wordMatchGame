//
//  ScoreViewController.swift
//  WordMatchingGame
//
//  Created by Noor-us-saba Karim on 3/8/21.
//

import UIKit


class ScoreViewController: UIViewController {

    
    @IBOutlet var userScoreLabel: UILabel!
    
    var userScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("user final score = \(userScore)")
        userScoreLabel.text = String(userScore)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
