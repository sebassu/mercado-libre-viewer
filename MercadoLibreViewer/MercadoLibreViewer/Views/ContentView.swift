import SwiftUI

struct ContentView: View {
    private var repository = WebProductsRepository()

    @State var searchText = ""
    @State private var products: [Product] = []
    @FocusState private var isSearchBarFocused: Bool

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack {
                SearchBar(searchText: $searchText) { _ in
                    isSearchBarFocused = false
                }
                .focused($isSearchBarFocused)
                .frame(maxWidth: 880)

                ScrollView {

                }
                .background(Color.white)
                .ignoresSafeArea(edges: .bottom)
                .overlay(overlay)
            }
        }
    }

    @ViewBuilder
    private var overlay: some View {
        if isSearchBarFocused {
            Color.red.ignoresSafeArea()
        }
    }
}
