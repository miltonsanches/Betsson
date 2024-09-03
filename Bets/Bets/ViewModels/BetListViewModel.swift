//
//  BetListViewModel.swift
//  Bets
//
//  Created by Milton Leslie Sobrinho de Souza Sanches on 03/05/24.
//

import BetsCore

class BetListViewModel {
    private let repository: BetRepository
    private var bets: [Bet] = []
    
    var betViewModels: [BetViewModel] {
        return bets.map { BetViewModel(bet: $0) }
    }
    
    init(repository: BetRepository) {
        self.repository = repository
    }
    
    func fetchBets() async throws {
        self.bets = try await repository.updateOdds()
    }
}
