struct Response: Codable {
    let paging: PagingResponse
    let results: [Product]
}

struct PagingResponse: Codable {
    let total: Int
    let primaryResults: Int
    let offset: Int
    let limit: Int
}
