public protocol BetService {
    func loadBets() async throws -> [Bet]
    func saveBets(_ bets: [Bet]) async throws
}

public class BetRepository {
    private let service: BetService

    public init(service: BetService) {
        self.service = service
    }
    
    public func updateOdds() async throws -> [Bet] {
        var bets = try await service.loadBets()

        for i in 0 ..< bets.count {
            bets[i].type.updateQuality(for: &bets[i])
            bets[i].type.updateSellIn(for: &bets[i])
        }

        try await service.saveBets(bets)
        return bets
    }
}
