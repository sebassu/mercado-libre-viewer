struct SearchSuggestionsResponse: Codable {
    let suggestedQueries: [SuggestedQuery]
}

struct SuggestedQuery: Codable {
    let q: String
}
