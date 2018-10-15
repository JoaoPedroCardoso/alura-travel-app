import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var quantityOfDaysLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var imageTravel: UIImageView!
    
    func cellConfig(_ travel: Travel) {
        titleLabel.text = travel.title
        quantityOfDaysLabel.text = travel.quantityOfDays == 1 ? "1 day" : "\(travel.quantityOfDays) days"
        priceLabel.text = "R$ \(travel.price)"
        imageTravel.image = UIImage(named: travel.imagePath)
        imageTravel.layer.cornerRadius = 10
        imageTravel.layer.masksToBounds = true
    }
    
}
