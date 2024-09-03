//
//  NewBetType.swift
//  Bets
//
//  Created by Milton Leslie Sobrinho de Souza Sanches on 03/05/24.
//

import Foundation

public class NewBetType: BetType {
    public func updateQuality(for bet: inout Bet) {
        // Example: Increase quality by 2 if it's less than 50
        if bet.quality < 50 {
            bet.quality += 2
        }
    }

    public func updateSellIn(for bet: inout Bet) {
        // Example: Decrease sell-in by 2 to simulate faster expiration
        bet.sellIn -= 2
    }
}
