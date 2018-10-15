import UIKit

class PaymentConfirmationViewController: UIViewController {
    
    @IBOutlet weak var imagePackage: UIImageView!
    
    @IBOutlet weak var titlePackage: UILabel!
    
    @IBOutlet weak var hotelPackage: UILabel!
    
    @IBOutlet weak var packageDate: UILabel!
    
    @IBOutlet weak var amaountPeople: UILabel!
    
    @IBOutlet weak var packageDescription: UILabel!
    
    @IBOutlet weak var backToHomeButton: UIButton!
    
    var packageTravel:TravelPackage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let package = packageTravel {
            titlePackage.text = package.travel.title.uppercased()
            imagePackage.image = UIImage(named: package.travel.imagePath)
            hotelPackage.text = package.hotelName
            packageDate.text = package.travelDate
            packageDescription.text = package.descriptions
            
            self.imagePackage.layer.cornerRadius = 10
            self.imagePackage.layer.masksToBounds = true
            self.backToHomeButton.layer.cornerRadius = 8
        }
    }
    
    @IBAction func backToHomeButton(_ sender: UIButton) {
        if let navigation = self.navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }
    
}
