import Foundation

//Базовая структура для хранения полей подгружаемых данных
//Так как данные содержат нижнее подчеркивание -- изменяем их имя

public struct Job: Codable{
    let id: String?
    let type: String?
    let createdAt: String?
    let company: String?
    let companyURL: URL?
    let location: String?
    let title: String?
    let description: String?
    let howToApply: String?
    let companyLogo: URL?
    
    private enum CodingKeys: String, CodingKey{
        case id
        case type
        case createdAt = "created_at"
        case company
        case companyURL = "company_url"
        case location
        case title
        case description
        case howToApply = "how_to_apply"
        case companyLogo = "company_logo"
    }
}
