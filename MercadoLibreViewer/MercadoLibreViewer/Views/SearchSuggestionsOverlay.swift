import SwiftUI

struct SearchSuggestionsOverlay: View {
    private var repository = WebSearchSuggestionsHelper()

    @Binding var searchText: String
    @State private var searchSuggestions: [SuggestedQuery]

    init(searchText: Binding<String>) {
        _searchText = searchText
    }

    var body: some View {
        List(searchSuggestions) {
            SearchSuggestionItem(suggestion: $0, searchText: $searchText)
        }.listStyle(.plain)
    }
}
