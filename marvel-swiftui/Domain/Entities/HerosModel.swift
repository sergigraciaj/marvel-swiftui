import Foundation

public struct ResponseModel: Codable {
    public let code: Int
    public let status: String
    public let copyright: String
    public let attributionText: String
    public let attributionHTML: String
    public let etag: String
    public let data: DataModel
}

public struct DataModel: Codable {
    public let offset: Int
    public let limit: Int
    public let total: Int
    public let count: Int
    public let results: [HerosModel]
}

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
