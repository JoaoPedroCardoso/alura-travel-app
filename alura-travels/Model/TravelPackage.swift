import UIKit

class TravelPackage: NSObject {
    
    let hotelName: String
    let descriptions: String
    let travelDate: String
    let travel: Travel
    
    init(hotelName: String, descriptions: String, travelDate: String, travel: Travel) {
        self.hotelName = hotelName
        self.descriptions = descriptions
        self.travelDate = travelDate
        self.travel = travel
    }
    
}
