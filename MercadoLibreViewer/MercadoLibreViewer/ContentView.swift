import SwiftUI

struct ContentView: View {
    @StateObject var repository = WebAPIProductsRepository()
    @State var showSearchOverlay = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                ForEach(repository.products, id: \.self) { product in
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
                try await repository.getSearchResults(forQuery: "alfombras")
            }
        } label: {
            Text("Search")
        }.frame(maxWidth: .infinity)
    }
}
