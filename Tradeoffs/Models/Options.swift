import Foundation

enum Option: String, CaseIterable, Identifiable {
    case good = "Good"
    case fast = "Fast"
    case cheap = "Cheap"

    var id: String { rawValue }
}
