//
//  StandardBetType.swift
//  Bets
//
//  Created by Milton Leslie Sobrinho de Souza Sanches on 03/05/24.
//

import Foundation

public protocol BetType {
    func updateQuality(for bet: inout Bet)
    func updateSellIn(for bet: inout Bet)
}

public class StandardBetType: BetType {
    public func updateQuality(for bet: inout Bet) {
        if bet.quality > 0 {
            bet.quality -= 1
        }
    }

    public func updateSellIn(for bet: inout Bet) {
        bet.sellIn -= 1
    }
}

public class ImprovingBetType: BetType {
    public func updateQuality(for bet: inout Bet) {
        if bet.quality < 50 {
            bet.quality += 1
        }
    }

    public func updateSellIn(for bet: inout Bet) {
        bet.sellIn -= 1
    }
}
