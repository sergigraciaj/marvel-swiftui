struct HeroDetailModel: Codable {
    let name: String
    let series: Series
}

struct Series: Codable {
    let available: Int
    let collectionURI: String
}
