import SwiftUI

struct SearchBar: View {
    @State private var searchText = ""
    @State private var isActive = false
    private var previousSearchText = ""

    var body: some View {
        HStack {
            searchInput
            if (isActive) { cancelButton }
        }.padding(EdgeInsets(top: 20, leading: 26,
            bottom: 16, trailing: 26))
    }

    var searchInput: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("search", text: $searchText)
            if (!searchText.isEmpty) { resetTextButton }
        }.padding(8)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
            .shadow(color: .black.opacity(0.2), radius: 4, y: 2)
    }

    var resetTextButton: some View {
        Button(action: {
            self.searchText = ""
        }) {
            Image(systemName: "multiply.circle").foregroundColor(.black)
                .padding(.trailing, 2)
        }
    }

    var cancelButton: some View {
        Button("cancel", role: .cancel, action: {
            self.searchText = previousSearchText
        }).buttonStyle(.bordered).buttonBorderShape(.capsule)
    }
}
