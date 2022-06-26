import Combine
import Foundation

@MainActor protocol ProductRepository {
    var products: [Product] { get }
    func getSearchResults(forQuery: String) async throws
}
