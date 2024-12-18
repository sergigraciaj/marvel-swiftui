import Foundation

public struct HerosModel: Codable, Identifiable, Sendable {
    public let id: Int
    public let name: String
    let thumbnail: Thumbnail
    public var photo: String {
        return thumbnail.path + "." + thumbnail.thumbnailExtension
    }
}

struct Thumbnail: Codable {
    let path: String
    let thumbnailExtension: String
    
    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}
