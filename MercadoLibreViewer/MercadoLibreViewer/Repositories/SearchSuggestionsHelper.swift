import Combine
import Foundation

protocol SearchSuggestionsHelper {
    func getSearchSuggestions(forPrompt: String) async throws -> [SuggestedQuery]
}
