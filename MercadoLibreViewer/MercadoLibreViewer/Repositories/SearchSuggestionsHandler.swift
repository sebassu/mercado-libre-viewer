import Combine
import Foundation

protocol SearchSuggestionsHandler {
    func getMostSearchedItems() async throws -> [Trend]
    func getSearchSuggestions(forPrompt: String) async throws -> [SuggestedQuery]
}
