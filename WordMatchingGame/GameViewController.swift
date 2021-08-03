//
//  GameViewController.swift
//  WordMatchingGame
//
//  Created by Noor-us-saba Karim on 3/8/21.
//

import UIKit

class GameViewController: UIViewController {
    
    enum Fruits: String, CaseIterable {
        case apple = "apple",
             banana = "banana",
             orange = "orange",
             grapes = "grapes",
             watermelon = "watermelon",
             strawberry = "strawberry",
             blueberry = "blueberry",
             kiwi = "kiwi",
             pomegranate = "pomegranate"
    }

    var fruitNamesArray:[String]=[]
    var userScore: Int = 0
    var totalScore: Int = 0
    
    @IBOutlet var userScoreLabel: UILabel!
    @IBOutlet var currentWordLabel: UILabel!
    @IBOutlet var guessGridButton: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        populateArrayWithNames()
        populateImageButtons()
        updateWordForRound()
        
    }
    
    func populateArrayWithNames(){
        for fruit in Fruits.allCases{
            print("the fruit name is \(fruit.rawValue)")
            fruitNamesArray.append(fruit.rawValue)
        }
        fruitNamesArray.shuffle()
        totalScore = fruitNamesArray.count
    }
    
    func populateImageButtons(){
        
        guard fruitNamesArray.count >= guessGridButton.count else {
            return
        }
        
        var index=0
        for button in guessGridButton{
            let imageForButton = UIImage(named: "\(fruitNamesArray[index]).jpg")
            
            button.setImage(imageForButton, for: .normal)
            button.accessibilityIdentifier = fruitNamesArray[index]
            index += 1
        }
    }
    
    func updateWordForRound(){
        
        guard let index = fruitNamesArray.indices.randomElement()
        else{
            gameFinished()
            return
        }
        currentWordLabel.text = fruitNamesArray.remove(at: index)
    }

    func updateUserScore(){
        userScore += 1
        userScoreLabel.text = "Score: \(userScore)"
    }
    
    func gameFinished(){
        for button in guessGridButton{
            button.isEnabled = false
        }
        performSegue(withIdentifier: "showScore", sender: self)
    }
    
    @IBAction func gridButtonTapped(_ sender: UIButton) {
        
        guard let guessedWord = sender.accessibilityIdentifier
        else{
           return
        }
        if guessedWord == currentWordLabel.text{
            updateUserScore()
        }
        updateWordForRound()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destination as? ScoreViewController
        destinationVC?.userScore = userScore
        destinationVC?.totalScore = totalScore
        
    }
    

}
