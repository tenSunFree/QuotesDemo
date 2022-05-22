import Foundation
import AVFoundation

class SpeechManager: ObservableObject {
    static let synth = AVSpeechSynthesizer()
    static let shared = SpeechManager()
    
    private var quo: Quote = Quote.initQuote
    @Published var isSpeaking = false
    init() {
        print("initialising SpeechManager with \(SpeechManager.synth.description)")
    }
}

extension SpeechManager {
    func textToSpeech(quote: Quote) {
        NSLog("SpeechManager, textToSpeech")
        if SpeechManager.synth.isPaused {
            NSLog("SpeechManager, textToSpeech2")
            SpeechManager.synth.continueSpeaking()
            isSpeaking = true
        } else if SpeechManager.synth.isSpeaking {
            NSLog("SpeechManager, textToSpeech3")
            SpeechManager.synth.pauseSpeaking(at: AVSpeechBoundary.immediate)
            isSpeaking = false
        } else if !SpeechManager.synth.isSpeaking {
            NSLog("SpeechManager, textToSpeech4, author: \(quote.author)")
            NSLog("SpeechManager, textToSpeech4, text: \(quote.text)")
            let utterance = AVSpeechUtterance(string: quo.text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.rate = 0.4
            SpeechManager.synth.speak(utterance)
            isSpeaking = true
        } else{
            NSLog("SpeechManager, textToSpeech5")
        }
    }
    
    func resetState() {
        NSLog("SpeechManager, resetState")
        SpeechManager.synth.stopSpeaking(at: AVSpeechBoundary.immediate)
        isSpeaking = false
    }
}
