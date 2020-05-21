


import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    var success, message: String?
    var data: DataClass?
    var accessToken, tokenStatus: String?

    enum CodingKeys: String, CodingKey {
        case success, message, data
        case accessToken = "AccessToken"
        case tokenStatus = "TokenStatus"
    }
}

// MARK: - DataClass
struct DataClass: Codable {
    var merchantQR: String?
    var merchantWalletBalance: Int?
    var merchantProfilePic: String?
    var businessName, businessEmail, merchantCategory, merchantSubCategory: String?
    var merchantKYCStatus, merchantKYCUploaded, email, bioMetricEnabled: String?
    var isQuickPinRegistered, loginPreference, name, gender: String?
    var countryName, kycVerified, qrCode, userType: String?
    var currencyName, currencyCode, currencySymbol: String?
    var walletBalance, dailyWalletTransferLimit, monthlyWalletTransferLimit, dailyWalletSpent: Int?
    var monthlyWalletSpent, walletTransferLimit, walletHoldingLimit, bankTransferLimit: Int?
    var dailyBankTransferLimit, dailyBankSpent: Int?
    var biometricDevice: JSONNull?
    var isRegisteredMerchant, language, lastLogin, isDeviceIDRegistered: String?
    var kycStatus, kycUploaded, profilePicturePath: String?
    var languageID: Int?

    enum CodingKeys: String, CodingKey {
        case merchantQR, merchantWalletBalance, merchantProfilePic, businessName, businessEmail, merchantCategory, merchantSubCategory, merchantKYCStatus, merchantKYCUploaded
        case email = "Email"
        case bioMetricEnabled = "BioMetricEnabled"
        case isQuickPinRegistered
        case loginPreference = "LoginPreference"
        case name = "Name"
        case gender = "Gender"
        case countryName = "CountryName"
        case kycVerified = "KYCVerified"
        case qrCode = "QRCode"
        case userType = "UserType"
        case currencyName = "CurrencyName"
        case currencyCode = "CurrencyCode"
        case currencySymbol = "CurrencySymbol"
        case walletBalance = "WalletBalance"
        case dailyWalletTransferLimit = "DailyWalletTransferLimit"
        case monthlyWalletTransferLimit = "MonthlyWalletTransferLimit"
        case dailyWalletSpent = "DailyWalletSpent"
        case monthlyWalletSpent = "MonthlyWalletSpent"
        case walletTransferLimit = "WalletTransferLimit"
        case walletHoldingLimit = "WalletHoldingLimit"
        case bankTransferLimit = "BankTransferLimit"
        case dailyBankTransferLimit = "DailyBankTransferLimit"
        case dailyBankSpent = "DailyBankSpent"
        case biometricDevice = "BiometricDevice"
        case isRegisteredMerchant = "IsRegisteredMerchant"
        case language = "Language"
        case lastLogin = "LastLogin"
        case isDeviceIDRegistered = "IsDeviceIDRegistered"
        case kycStatus = "KYCStatus"
        case kycUploaded = "KYCUploaded"
        case profilePicturePath = "ProfilePicturePath"
        case languageID = "languageId"
    }
}

