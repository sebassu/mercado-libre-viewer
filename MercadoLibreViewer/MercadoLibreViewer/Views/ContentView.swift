import SwiftUI

struct ContentView: View {
    private var repository = WebProductsRepository()

    @State private var searchText = ""
    @State private var products: [Product] = []

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            VStack() {
                SearchBar().frame(maxWidth: 880)
                ScrollView {
                    
                }
                .background(Color.white)
                .ignoresSafeArea(edges: .bottom)
            }
        }
    }
}
