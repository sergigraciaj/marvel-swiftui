import Foundation

public struct HerosModel: Codable, Identifiable, Sendable {
    public let id: UUID
    public let name: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
