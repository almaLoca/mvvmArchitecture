
import Foundation


// MARK: - PostElement
struct ComentElement: Codable {
    var postID, id: Int?
    var name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

typealias Comments = [ComentElement]
