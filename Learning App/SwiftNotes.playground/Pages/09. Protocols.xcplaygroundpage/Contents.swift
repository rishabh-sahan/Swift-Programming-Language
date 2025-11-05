protocol GameTemplate {
    var gameNames: [String] {get set}
    func printGameNames()
    func printGameCount()
}
struct Game: GameTemplate {
    func printGameCount() {
        print(gameNames.count)
    }
    var gameNames: [String] = []
    func printGameNames() {
        for name in gameNames {
            print(name)
        }
    }
}
var engine = Game()
engine.gameNames = ["FF", "PUBG"]
engine.printGameNames()
engine.printGameCount()
