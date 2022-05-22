import SwiftUI
import Foundation
import SystemConfiguration
import AVFoundation

enum ActiveSheet: Identifiable {
    case shareSheetView, buyStorageSheetView
    var id: Int {
        hashValue
    }
}

struct QuoteGeneratorView: View {
    @Environment(\.managedObjectContext) var moc
    var savedQuotesa: Quote?
    @EnvironmentObject var quoteViewModel: QuoteViewModel
    @State private var activeSheet: ActiveSheet?
    @State private var savedToDevice = false
    @State private var addedToClipboard = false
    @State private var rect1: CGRect = .zero
    @State private var uiImage: UIImage?
    @State private var viewState = CGSize.zero
    @State private var showBuying = false
    @State private var attempts: Int = 0
    
    @StateObject var speechManager = SpeechManager.shared
    @StateObject var speechDelegate = SpeechDelegate.shared
    var body: some View {
        ZStack {
            VStack {
                Color.black
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                    .overlay(
                        QuoteView()
                            .frame(
                                maxWidth: .infinity,
                                maxHeight: .infinity
                            )
                            .animation(.spring())
                            .onTapGesture {
                                savedToDevice = false
                                addedToClipboard = false
                            }
                            .onReceive(NotificationCenter.default.publisher(
                                for: UIApplication.didBecomeActiveNotification
                            )) { _ in
                            },
                        alignment: .topLeading
                    )
                HStack {
                    speakButton
                }.disabled(quoteViewModel.quote.text.isEmpty)
            }
        }
    }
    var speakButton: some View {
        Button {
            speechManager.textToSpeech(quote: quoteViewModel.quote)
        } label: {
            Image(systemName: speechManager.isSpeaking ? "speaker.wave.2" : "speaker.wave.2")
        }.buttonStyle(IconButtonStyle())
            .accessibilityLabel(Text("Quote text to speech"))
            .accessibility(hint: Text("Speak the quote text to your ears"))
    }
}
