//
//  Sign.swift
//  Rock Paper Scissors
//
//  Created by Gianluca Orpello on 14/01/21.
//

import Foundation

func randomSign() -> Sign {
    let signNumber = Int.random(in: 0...2)
    
    if signNumber == 0 {
        return .rock
    }else if signNumber == 2 {
        return .scissors
    }else {
        return .paper
    }
    
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
            case .rock:
                return "👊"
            case .paper:
                return "🖐"
            case .scissors:
                return "✌️"
        }
    }
    
    func gameLogic(with opponentSign: Sign) -> GameState {
        if self == opponentSign {
            return .draw
        }
        
        switch self {
            case .rock:
                if opponentSign == .scissors{
                    return .win
                }
            case .paper:
                if opponentSign == .rock {
                    return .win
                }
                
            case .scissors:
                if opponentSign == .paper {
                    return .win
                }
                
        }
        
        return .lose
    }
}
