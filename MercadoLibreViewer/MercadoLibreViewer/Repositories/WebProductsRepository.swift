import Combine
import Foundation

fileprivate let baseURL = URL(string: "https://api.mercadolibre.com/")

class WebProductsRepository: ProductRepository {
    private let decoder = JSONDecoder()
    private let siteID = getSiteIDForCurrentLocale()

    init() {
        decoder.keyDecodingStrategy = .convertFromSnakeCase
    }

    func getSearchResults(forQuery query: String) async throws -> [Product] {
        let url = URL(string: "sites/\(siteID)/search", relativeTo: baseURL)!
        let request = buildRequest(for: url, with: [URLQueryItem(name: "q", value: query)])
        let (data, _) = try await URLSession.shared.data(for: request)
        return (try decoder.decode(Response.self, from: data)).results
    }

    private func buildRequest(for url: URL, with queryItems: [URLQueryItem]) -> URLRequest {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return URLRequest(url: urlComponents.url!)
    }
}

fileprivate func getSiteIDForCurrentLocale() -> String {
    let regionCode = Locale.current.regionCode
    switch regionCode {
    case "AR": return "MLA"
    case "BR": return "MLB"
    case "CL": return "MLC"
    case "DM": return "MRD"
    case "MX": return "MLM"
    case "VE": return "MLV"
    case "BO", "CO", "CR", "CU", "EC", "GT", "HN", "NI", "PA", "PE", "PY", "SV":
        return "M\(regionCode!)"
    default: return "MLU"
    }
}
