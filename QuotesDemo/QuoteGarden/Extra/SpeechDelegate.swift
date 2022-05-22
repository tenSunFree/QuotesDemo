import Foundation
import AVFoundation

class SpeechDelegate: NSObject, ObservableObject, AVSpeechSynthesizerDelegate {
  static let shared = SpeechDelegate()

  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
      NSLog("SpeechDelegate, application, configurationForConnecting")
    print("the utterance started")
  }

  func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
    print("the utterance finished")
  }
}
