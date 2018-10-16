import UIKit

class PackagesTravelsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageTravel: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var quantityOfDaysLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    func configCell(_ travelPackage: TravelPackage) {
        titleLabel.text = travelPackage.travel.title
        quantityOfDaysLabel.text = travelPackage.travel.quantityOfDays == 1 ? "1 day" : "\(travelPackage.travel.quantityOfDays) days"
        priceLabel.text = "from R$ \(travelPackage.travel.price)"
        imageTravel.image = UIImage(named: travelPackage.travel.imagePath)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }
}
