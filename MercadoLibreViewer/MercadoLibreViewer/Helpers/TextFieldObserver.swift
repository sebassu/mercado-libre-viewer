import Combine
import Foundation

class TextFieldObserver: ObservableObject {
    @Published var text = ""
    @Published var debouncedText = ""

    init(delay: DispatchQueue.SchedulerTimeType.Stride) {
        $text.throttle(for: delay, scheduler: DispatchQueue.main, latest: true)
            .assign(to: &$debouncedText)
    }
}
