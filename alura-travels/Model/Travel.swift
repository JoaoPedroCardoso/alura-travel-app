import UIKit

class Travel: NSObject {

    let title: String
    let quantityOfDays: Int
    let price: String
    let imagePath: String
    
    init(title: String, quantityOfDays: Int, price: String, imagePath: String) {
        self.title = title
        self.quantityOfDays = quantityOfDays
        self.price = price
        self.imagePath = imagePath
    }
    
}
