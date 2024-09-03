//
//  BetViewModel.swift
//  Bets
//
//  Created by Milton Leslie Sobrinho de Souza Sanches on 03/05/24.
//

import BetsCore

class BetViewModel {
    private var bet: Bet
    
    var name: String {
        return bet.name
    }
    
    var sellIn: Int {
        return bet.sellIn
    }
    
    var quality: Int {
        return bet.quality
    }
    
    init(bet: Bet) {
        self.bet = bet
    }
}
