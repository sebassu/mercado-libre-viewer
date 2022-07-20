struct ProductSearchResponse: Decodable {
    let paging: PagingData
    let results: [Product]
}

struct PagingData: Decodable {
    let total: Int
    let primaryResults: Int
    let offset: Int
    let limit: Int
}
