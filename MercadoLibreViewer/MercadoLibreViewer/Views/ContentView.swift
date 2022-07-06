import SwiftUI

struct ContentView: View {
    private var repository = WebProductsRepository()

    @State var searchText = ""
    @State private var products: [Product] = []
    @FocusState private var isSearchBarFocused: Bool

    @State private var showAlert = false
    @State private var isLoading = false

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                SearchBar(searchText: $searchText, onSearch: fetchProducts)
                    .focused($isSearchBarFocused)
                    .frame(maxWidth: 880)
                mainContentsView.overlay(searchOverlay)
            }
        }.alert("title", isPresented: $showAlert) {
            Button("OK") { }
        } message: {
            Text("description")
        }
    }

    @ViewBuilder
    private var mainContentsView: some View {
        if (products.isEmpty) { TrendsView(onTap: fetchProducts) }
        else { productsView }
    }

    @ViewBuilder
    private var productsView: some View {
        VStack {
            List(products) { ProductItem(product: $0) }
            if isLoading { ProgressView() }
        }.background(Color(uiColor: .secondarySystemBackground))
    }

    @ViewBuilder
    private var searchOverlay: some View {
        if isSearchBarFocused {
            SearchSuggestionsOverlay(searchText: $searchText)
        }
    }

    private func fetchProducts(forQuery query: String) async {
        do {
            isLoading = true
            products = try await repository.getSearchResults(forQuery: query)
            isLoading = false
        } catch { showAlert = true }
    }
}
