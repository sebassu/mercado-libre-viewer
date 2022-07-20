import SwiftUI

struct SearchSuggestionItem: View {
    var suggestion: SuggestedQuery
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            Text(.init(suggestion.formattedText))
            Spacer()
            Button {
                searchText = suggestion.text
            } label: {
                Image(systemName: "arrow.up.left")
            }.buttonStyle(.plain)
        }.padding(.vertical, 9)
    }
}
