import Foundation

enum Endpoints {
    case heros
    case heroDetail(id: Int)

    var path: String {
        switch self {
        case .heros:
            return "/public/characters"
        case .heroDetail(let id):
            return "/public/characters/\(id)/series"
        }
    }
}
