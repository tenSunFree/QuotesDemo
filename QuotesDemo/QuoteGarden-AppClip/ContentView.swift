import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var quote = Quote.help
    // @Binding var showingShareSheetView: Bool
    // @State private var addedToClipboard = false
    @State private var rect1: CGRect = .zero
    @State private var image: UIImage?
    @State var viewState = CGSize.zero
    let synthesizer: AVSpeechSynthesizer
    var body: some View {
        VStack {
            Color.clear.overlay(
                QuoteView()
                    .gesture(
                        LongPressGesture().onChanged { _ in
                            quote = Quote(id: "", text: "", author: "", genre: "")
                            getRandomQuotes { quote in
                                self.quote = quote
                                // addedToClipboard = false
                            }
                        }
                    )
                    .animation(.spring())
            ).getRect($rect1)
                .onChange(of: image) { _ in self.image = self.rect1.uiImage }
                .accessibility(addTraits: .isButton)
                .accessibility(label: Text("Change quote"))
                .accessibility(hint: Text("Changes quote when tapped, and display them"))
        }
    }
    func getRandomQuotes(completion: @escaping (Quote) -> Void) {
        let randomQuote = Int.random(in: 0..<49)
        let url = Bundle.main.url(forResource: "sampleQuotes.json", withExtension: nil)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                print(String(describing: error))
                return
            }
            DispatchQueue.main.async {
                completion(response.data[randomQuote])
            }
            //print(String(data: data, encoding: .utf8)!)
        }
        .resume()
    }
}
