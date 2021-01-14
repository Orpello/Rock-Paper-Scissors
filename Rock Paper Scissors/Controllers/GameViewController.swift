//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Gianluca Orpello on 14/01/21.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI(for: .start)
    }
    
    func updateUI(for state: GameState)  {
        statusLabel.text = state.status
        
        switch state {
            case .start:
                signLabel.text = "🤖"
                
                playAgainButton.isHidden = true
                                
                rockButton.isHidden = false
                paperButton.isHidden = false
                scissorsButton.isHidden = false
                
                view.backgroundColor = .systemBackground
                
                break
            case .win:
                view.backgroundColor = .green
                
                break
            case .lose:
                view.backgroundColor = .red
                
                break
            case .draw:
                view.backgroundColor = .gray
                
                break
        }
    }
    
    func play(with sign: Sign) {
        
        let cpuSign = randomSign()
        
        let gameState = sign.gameLogic(with: cpuSign)
        updateUI(for: gameState)
        
        signLabel.text = cpuSign.emoji
        
        switch sign {
            case .rock:
                paperButton.isHidden = true
                scissorsButton.isHidden = true
            case .scissors:

                paperButton.isHidden = true
                rockButton.isHidden = true
            case .paper:
                scissorsButton.isHidden = true
        }
        
        playAgainButton.isHidden = false
        
    }
    
    
    @IBAction func rockChosen(_ sender: UIButton) {
        play(with: .rock)
    }
    
    @IBAction func paperChosen(_ sender: UIButton) {
        play(with: .paper)
    }
    
    @IBAction func scissorsChosen(_ sender: UIButton) {
        play(with: .scissors)
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        updateUI(for: .start)
    }
}

