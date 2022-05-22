import SwiftUI

struct QuoteView: View {
    
    @State private var quo: Quote = Quote.initQuote
    
    var body: some View {
        VStack(alignment: .center) {
            Text(quo.text)
                .font(Font.system(.title, design: .default).weight(.light))
                .padding(.horizontal)
                .allowsTightening(true)
                .layoutPriority(2)
                .minimumScaleFactor(0.3)
            Spacer()
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .topLeading
        )
            .foregroundColor(Color("TextColor"))
            .multilineTextAlignment(.center)
            .padding()
            .background(Color.gray.clipShape(RoundedRectangle(cornerRadius: 25)))
            .padding()
    }
}
