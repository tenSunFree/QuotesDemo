import SwiftUI
import AVFoundation

@main
struct QuoteGardenAppClipApp: App {
  let synthesizer = AVSpeechSynthesizer()
  var body: some Scene {
    WindowGroup {
      ContentView(synthesizer: synthesizer).onContinueUserActivity(NSUserActivityTypeBrowsingWeb) { userActivity in
        guard let incomingURL = userActivity.webpageURL,
              let _ = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true)
        else {
          return
        }
      }
    }
  }
  func handleUserActivity(_ userActivity: NSUserActivity) {
    guard let incomingURL = userActivity.webpageURL,
          let components = NSURLComponents(url: incomingURL, resolvingAgainstBaseURL: true),
          let _ = components.queryItems else {
      return
    }
  }
}
