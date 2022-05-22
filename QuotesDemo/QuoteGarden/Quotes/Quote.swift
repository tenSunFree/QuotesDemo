import Foundation

struct Response: Codable {
    let statusCode: Int
    let data: [Quote]
}

struct Quote: Codable, Hashable {
    var id, text, author, genre: String
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case text = "quoteText"
        case author = "quoteAuthor"
        case genre = "quoteGenre"
    }
    static let initQuote = Quote(
        id: "1",
        text: "He was an old man who fished alone in a skiff in the Gulf1 Stream and he had gone eighty-four days now without taking a fish. In the first forty days a boy had been with him. But after forty days without a fish the boy’s parents had told him that the old man was now definitely and finally salao, which is the worst form of unlucky, and the boy had gone at their orders in another boat which caught three good fish the first week. It made the boy sad to see the old man come in each day with his skiff empty and he always went down to help him carry either the coiled lines or the gaff and harpoon2 and the sail that was furled around the mast. The sail was patched with flour sacks and, furled, it looked like the flag of permanent defeat.",
        author: "Nikola Franičević",
        genre: "help"
    )
    static let help = Quote(
        id: "1",
        text: "Tap here to generate a random quote",
        author: "Nikola Franičević",
        genre: "help"
    )
    static let screenshot = Quote(
        id: "2",
        text: "Success usually comes to those who are too busy looking for it",
        author: "Henry David Thoreau",
        genre: "motivation"
    )
}
