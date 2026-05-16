import Combine
import Foundation

// TODO: switch to observable macro
class TradeoffsViewModel: ObservableObject {
    @Published private(set) var selections: [Option] = []

    func isSelected(_ option: Option) -> Bool {
        selections.contains(option)
    }

    func toggle(_ option: Option) {
        if let index = selections.firstIndex(of: option) {
            selections.remove(at: index)
            return
        }
        selections.append(option)
        if selections.count > 2 {
            selections.removeFirst()
        }
    }

    var tradeoffMessage: String? {
        guard selections.count == 2 else { return nil }
        let set = Set(selections)
        switch set {
        case [.good, .cheap]: return "Will be slow"
        case [.fast, .good]: return "Will be expensive"
        case [.cheap, .fast]: return "Will be low quality"
        default: return nil
        }
    }
}
