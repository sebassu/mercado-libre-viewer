import Combine
import Foundation

class WebSearchSuggestionsHelper: SearchSuggestionsHelper {
    private let decoder = JSONDecoder()
    private let suggestionsURL = URL(string: "https://http2.mlstatic.com/resources/sites/\(Locale.currentSiteId)/autosuggest")!

    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func getSearchSuggestions(forPrompt prompt: String) async throws -> [String] {
        let request = URLRequest.buildQuery(for: self.suggestionsURL, withValue: prompt)
        let (data, _) = try await URLSession.shared.data(for: request)
        return (try decoder.decode(SearchSuggestionsResponse.self,
            from: data)).suggestedQueries.map({ $0.q })
    }
}
