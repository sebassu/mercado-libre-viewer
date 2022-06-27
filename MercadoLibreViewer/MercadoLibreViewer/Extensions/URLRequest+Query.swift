import Foundation

extension URLRequest {
    static func buildQuery(for url: URL, withValue value: String) -> URLRequest {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = [URLQueryItem(name: "q", value: value)]
        return URLRequest(url: urlComponents.url!)
    }
}
