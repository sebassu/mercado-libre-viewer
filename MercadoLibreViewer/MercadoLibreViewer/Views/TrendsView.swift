import SwiftUI

struct TrendsView: View {
    private var repository = WebSearchSuggestionsHandler()

    @State private var trends: [Trend] = []
    private var onTap: (String) async -> Void

    init(onTap: @escaping (String) async -> Void) {
        self.onTap = onTap
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("frequent-searches").font(.title2).padding([.top, .leading], 18)
            if (trends.isEmpty) { centeredProgressView }
            else {
                List(trends) { trend in
                    TrendItem(trend: trend).onTapGesture {
                        Task { await onTap(trend.keyword) }
                    }
                }.listStyle(.plain).padding(.horizontal, 9)
            }
            Spacer()
        }.background(Color(uiColor: .secondarySystemBackground))
            .onAppear(perform: { Task {
            trends = try! await repository.getMostSearchedItems()
        } })
    }

    @ViewBuilder
    private var centeredProgressView: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}
