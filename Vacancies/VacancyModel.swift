import Foundation

struct Vacancy: Decodable {
    let job_id: String
    let title: String
    let company: String
    let location: String
    let description: String
    let long_description: String
    let salary: String
    let date_posted: String
    let image_url: String
    
}
