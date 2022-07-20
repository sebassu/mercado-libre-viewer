import SwiftUI
import Combine

struct SearchInputField: View {
    @Binding var searchText: String
    @StateObject private var textObserver = TextFieldObserver(delay: 0.8)

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("search", text: $textObserver.text)
                .onReceive(textObserver.$debouncedText) { searchText = $0 }
            if !searchText.isEmpty { resetTextButton }
        }.padding(8)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
            .shadow(color: .black.opacity(0.2), radius: 4, y: 2)
            .onChange(of: searchText, perform: { textObserver.text = $0 })
    }

    var resetTextButton: some View {
        Button {
            textObserver.text = ""
        } label: {
            Image(systemName: "multiply.circle")
                .foregroundColor(.black)
                .padding(.trailing, 2)
        }
    }
}
