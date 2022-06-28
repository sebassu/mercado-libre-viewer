import Combine
import Foundation

protocol ProductRepository {
    func getSearchResults(forQuery: String) async throws -> [Product]
}
