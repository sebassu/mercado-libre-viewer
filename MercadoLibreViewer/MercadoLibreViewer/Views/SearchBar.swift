import SwiftUI

struct SearchBar: View {
    @Binding private var searchText: String
    private var onSearch: (String) async -> Void

    @FocusState private var isFocused: Bool
    @State private var isCancelButtonShown = false
    private var previousSearchText = ""

    init(searchText: Binding<String>, onSearch: @escaping (String) async -> Void) {
        self._searchText = searchText
        self.onSearch = onSearch
    }

    var body: some View {
        HStack {
            SearchInputField(searchText: $searchText)
                .focused($isFocused).transition(.scale)
            if isCancelButtonShown { cancelButton }
        }.padding(EdgeInsets(top: 20, leading: 22, bottom: 16, trailing: 22))
            .onChange(of: isFocused) { newValue in
            withAnimation {
                isCancelButtonShown = newValue
            }
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
