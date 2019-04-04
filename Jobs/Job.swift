import Foundation

struct Job: Codable{
    let id: String
    let type: String
    let created_at: String?
    let company: String
    let company_url: String?
    let location: String
    let title: String
    let description: String
    let how_to_apply: String?
    let company_logo: String?
}
