
import Foundation


// MARK: - PostElement
struct PostElement: Codable {
    var userID, id: Int?
    var title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias Post = [PostElement]
