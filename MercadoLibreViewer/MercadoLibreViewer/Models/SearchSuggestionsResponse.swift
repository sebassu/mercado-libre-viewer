struct SearchSuggestionsResponse: Decodable {
    let suggestedQueries: [SuggestedQuery]
}

struct SuggestedQuery: Decodable, Hashable, Identifiable {
    var id: String { text }
    let text: String
    let matchStart: Int
    let matchEnd: Int

    var formattedText: String {
        var result = String(text)
        result.insert(contentsOf: "**",
            at: result.index(result.startIndex, offsetBy: matchStart))
        result.insert(contentsOf: "**",
            at: result.index(result.startIndex, offsetBy: matchEnd + 2))
        return result
    }

    private enum CodingKeys: String, CodingKey {
        case text = "q"
        case matchStart
        case matchEnd
    }
}
