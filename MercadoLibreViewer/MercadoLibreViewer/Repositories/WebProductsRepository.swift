import Combine
import Foundation

class WebProductsRepository: ProductRepository {
    private let decoder = JSONDecoder()
    private let searchURL = URL(string: "https://api.mercadolibre.com/sites/\(Locale.currentSiteId)/search")!

    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func getSearchResults(forQuery query: String) async throws -> [Product] {
        let request = URLRequest.buildQuery(for: self.searchURL, withValue: query)
        let (data, _) = try await URLSession.shared.data(for: request)
        return (try decoder.decode(ProductSearchResponse.self, from: data)).results
    }
}
