struct Product: Decodable, Hashable, Identifiable {
    let id: String
    let title: String
    let price: Float
    let currencyId: String
    let thumbnail: String
}
