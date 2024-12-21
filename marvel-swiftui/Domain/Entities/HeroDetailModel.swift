struct HeroDetailModel: Codable, Identifiable, Sendable  {
    public let id: Int
    public let title: String
    public let description: String?
    let thumbnail: Thumbnail
    public var photo: String {
        return thumbnail.path + "." + thumbnail.thumbnailExtension
    }
}
