import SwiftUI

struct ContentView: View {
    @State private var products: [Product] = []
    private var repository = WebProductsRepository()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(self.products, id: \.self) { product in
                    Text(product.title).lineLimit(1)
                }
                HStack {
                    searchButton
                }
            }.padding(.horizontal, 20)
        }
    }

    private var searchButton: some View {
        Button {
            Task {
                self.products = try await repository.getSearchResults(forQuery: "alfombras")
            }
        } label: {
            Text("Search")
        }.frame(maxWidth: .infinity)
    }
}
