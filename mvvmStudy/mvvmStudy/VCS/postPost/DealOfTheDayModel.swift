
import Foundation

// MARK: - DealOfTheDay
struct DealOfTheDay: Codable {
    var totalCount: Int?
    var dealOfTheDayList: [DealOfTheDayList]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "TotalCount"
        case dealOfTheDayList = "DealOfTheDayList"
    }
}

// MARK: - DealOfTheDayList
struct DealOfTheDayList: Codable {
    var mrp: Int?
    var productCode, itemName: String?
    var bonusPoint: Int?
    var categoryCode: Category?
    var uniqueName: String?
    var totalCount: Int?
    var groupUnique: String?
    var discountPercentage: Int?
    var productDesc, thumbImage: String?
    var productID: Int?
    var modelnumber: JSONNull?
    var bdp: Int?
    var category: Category?
    var categoryUnique: CategoryUnique?
    var brand, brandUnique: String?

    enum CodingKeys: String, CodingKey {
        case mrp = "MRP"
        case productCode = "ProductCode"
        case itemName = "ItemName"
        case bonusPoint = "BonusPoint"
        case categoryCode = "CategoryCode"
        case uniqueName = "UniqueName"
        case totalCount = "TotalCount"
        case groupUnique = "GroupUnique"
        case discountPercentage = "DiscountPercentage"
        case productDesc = "ProductDesc"
        case thumbImage = "ThumbImage"
        case productID = "ProductId"
        case modelnumber = "Modelnumber"
        case bdp = "BDP"
        case category = "Category"
        case categoryUnique = "CategoryUnique"
        case brand = "Brand"
        case brandUnique = "BrandUnique"
    }
}

enum Category: String, Codable {
    case airConditioner = "AIR CONDITIONER"
    case washingMachine = "WASHING MACHINE"
}

enum CategoryUnique: String, Codable {
    case airConditioner = "AIR-CONDITIONER"
    case washingMachine = "WASHING-MACHINE"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
