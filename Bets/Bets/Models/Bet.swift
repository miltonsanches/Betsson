public struct Bet {
    public var name: String
    public var sellIn: Int
    public var quality: Int
    public var type: BetType

    public init(name: String, sellIn: Int, quality: Int, type: BetType) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
        self.type = type
    }

    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
        self.type = StandardBetType()
    }
}
