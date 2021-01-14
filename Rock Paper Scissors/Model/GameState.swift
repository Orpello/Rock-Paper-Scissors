//
//  GameState.swift
//  Rock Paper Scissors
//
//  Created by Gianluca Orpello on 14/01/21.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var status: String {
        switch self {
            case .start:
                return "Choose Rock, Paper or Scissors!"
            case .win:
                return "You Win!!"
            case .lose:
                return "You Lost..."
            case .draw:
                return "It's a Draw!"
        }
    }
    
}
