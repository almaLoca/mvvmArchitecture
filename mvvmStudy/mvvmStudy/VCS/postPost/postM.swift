
import Foundation

// MARK: - PostM
struct PostM: Codable {
    var id: Int?
    var body, title, userID: String?

    enum CodingKeys: String, CodingKey {
        case id, body, title
        case userID = "userId"
    }
}
