import SwiftUI

struct SearchSuggestionsOverlay: View {
    private var repository = WebSearchSuggestionsHelper()

    @Binding var searchText: String
    @State private var searchSuggestions: [SuggestedQuery] = []

    init(searchText: Binding<String>) {
        _searchText = searchText
    }

    var body: some View {
        List(searchSuggestions) {
            SearchSuggestionItem(suggestion: $0, searchText: $searchText)
        }.listStyle(.plain).onChange(of: searchText, perform: { value in
            Task {
                guard let suggestions = try? await repository.getSearchSuggestions(forPrompt: value)
                else { return }
                searchSuggestions = suggestions
            }
        })
    }
}
