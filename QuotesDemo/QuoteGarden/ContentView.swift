import SwiftUI
import Foundation

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var showOnboarding = false
    @AppStorage("OnboardBeenViewed") var hasOnboarded = false
    var body: some View {
        
        ZStack {
            QuoteGeneratorView(savedQuotesa: Quote.help).frame(
                maxWidth: .infinity,
                maxHeight: .infinity
            )
        }
        .background(Color.gray)
        .onAppear {
            NSLog("ContentView, body, onAppear")
            moc.undoManager = UndoManager()
            AppReviewRequest.requestReviewIfNeeded()
            if !hasOnboarded {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation {
                        showOnboarding.toggle()
                        hasOnboarded = true
                    }
                }
            }
        }
    }
    
}
