import Combine
import Foundation

class WebSearchSuggestionsHandler: SearchSuggestionsHandler {
    private let decoder = JSONDecoder()
    private let trendsURL = URL(string:
            "https://api.mercadolibre.com/trends/\(Locale.currentSiteId)")!
    private let suggestionsURL = URL(string:
            "https://http2.mlstatic.com/resources/sites/\(Locale.currentSiteId)/autosuggest")!

    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func getMostSearchedItems() async throws -> [Trend] {
        let request = URLRequest(url: trendsURL)
        let (data, _) = try await URLSession.shared.data(for: request)
        return (try decoder.decode([Trend].self, from: data))
    }

    func getSearchSuggestions(forPrompt prompt: String) async throws -> [SuggestedQuery] {
        let request = URLRequest.buildSuggestionsQuery(for: self.suggestionsURL, withValue: prompt)
        let (data, _) = try await URLSession.shared.data(for: request)
        return (try decoder.decode(SearchSuggestionsResponse.self, from: data)).suggestedQueries
    }
}
