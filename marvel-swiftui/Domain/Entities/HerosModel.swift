import Foundation

public struct HerosModel: Codable, Identifiable, Sendable {
    public let id: Int
    public let name: String
    let thumbnail: Thumbnail
    public var photo: String {
        return thumbnail.path + "." + thumbnail.thumbnailExtension
    }
}
