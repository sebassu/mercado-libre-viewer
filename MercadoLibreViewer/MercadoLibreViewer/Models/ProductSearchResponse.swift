struct ProductSearchResponse: Codable {
    let paging: PagingData
    let results: [Product]
}

struct PagingData: Codable {
    let total: Int
    let primaryResults: Int
    let offset: Int
    let limit: Int
}
