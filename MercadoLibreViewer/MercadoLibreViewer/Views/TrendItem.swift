import SwiftUI

struct TrendItem: View {
    var trend: Trend

    var body: some View {
        HStack {
            Image(systemName: "chart.bar.fill")
            Text(trend.keyword.capitalized)
        }.padding(.vertical, 9)
    }
}
