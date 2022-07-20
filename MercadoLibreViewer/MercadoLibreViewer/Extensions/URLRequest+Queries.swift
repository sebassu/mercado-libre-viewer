import Foundation

extension URLRequest {
    static func buildSuggestionsQuery(for url: URL, withValue value: String) -> URLRequest {
        return URLRequest.buildQuery(for: url, withItems: [URLQueryItem(name: "q", value: value),
            URLQueryItem(name: "limit", value: String(12))])
    }

    static func buildProductsQuery(for url: URL, withValue value: String, _ limit: Int = 0,
        _ offset: Int = 0) -> URLRequest {
        return URLRequest.buildQuery(for: url, withItems: [URLQueryItem(name: "q", value: value),
            URLQueryItem(name: "limit", value: String(12))])
    }

    private static func buildQuery(for url: URL, withItems queryItems: [URLQueryItem]) -> URLRequest {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = queryItems
        return URLRequest(url: urlComponents.url!)
    }
}
