import SwiftUI

struct SearchBar: View {
    @Binding private var searchText: String
    @FocusState private var isFocused: Bool
    @State private var isCancelButtonShown = false
    private var previousSearchText = ""

    init(searchText: Binding<String>, onSearch: (String) -> Void) {
        _searchText = searchText
    }

    var body: some View {
        HStack {
            searchInput.transition(.scale)
            if isCancelButtonShown { cancelButton }
        }.padding(EdgeInsets(top: 20, leading: 22, bottom: 16, trailing: 22))
            .onChange(of: isFocused) { newValue in
            withAnimation {
                isCancelButtonShown = newValue
            }
        }
    }

    var searchInput: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("search", text: $searchText).focused($isFocused)
            if !searchText.isEmpty { resetTextButton }
        }.padding(8)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
            .shadow(color: .black.opacity(0.2), radius: 4, y: 2)
    }

    var resetTextButton: some View {
        Button {
            searchText = ""
            isFocused = true
        } label: {
            Image(systemName: "multiply.circle")
                .foregroundColor(.black)
                .padding(.trailing, 2)
        }
    }

    var cancelButton: some View {
        Button("cancel", role: .cancel) {
            searchText = previousSearchText
            isFocused = false
        }.buttonStyle(.bordered).buttonBorderShape(.capsule)
            .transition(.scale(scale: 0.0001, anchor: .trailing))
    }
}
