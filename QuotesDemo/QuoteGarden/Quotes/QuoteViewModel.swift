import Foundation

class QuoteViewModel: ObservableObject {
    let speechManager = SpeechManager.shared
    @Published private(set) var quote = Quote.initQuote
}
