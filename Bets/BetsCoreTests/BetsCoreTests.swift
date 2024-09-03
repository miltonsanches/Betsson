import XCTest
@testable import BetsCore
@testable import Bets

class BetsCoreTests: XCTestCase {
    
    var remoteBetService: RemoteBetService!
    var betRepository: BetRepository!
    var testBet: Bet!

    override func setUp() {
        super.setUp()
        remoteBetService = RemoteBetService.instance
        betRepository = BetRepository(service: remoteBetService)
        testBet = Bet(name: "Test Bet", sellIn: 10, quality: 20)
    }

    override func tearDown() {
        remoteBetService = nil
        betRepository = nil
        testBet = nil
        super.tearDown()
    }

    func testBetViewModel() {
        let betViewModel = BetViewModel(bet: testBet)
        XCTAssertEqual(betViewModel.name, testBet.name)
        XCTAssertEqual(betViewModel.sellIn, testBet.sellIn)
        XCTAssertEqual(betViewModel.quality, testBet.quality)
    }
}
