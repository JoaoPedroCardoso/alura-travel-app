import UIKit

class TravelDetailsViewController: UIViewController {

    @IBOutlet weak var travelPackageImage: UIImageView!
    
    @IBOutlet weak var packageTitle: UILabel!
    
    @IBOutlet weak var packageDescription: UILabel!
    
    @IBOutlet weak var packageTravelDate: UILabel!
    
    @IBOutlet weak var packagePrice: UILabel!
    
    @IBOutlet weak var principalScroll: UIScrollView!
    
    @IBOutlet weak var expirationDate: UITextField!
    
    var packageSelected: TravelPackage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(tallScroll(notification: )), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(shortScroll(notification: )), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        if let package = packageSelected {
            self.travelPackageImage.image = UIImage(named: package.travel.imagePath)
            self.packageTitle.text = package.travel.title
            self.packageDescription.text = package.descriptions
            self.packageTravelDate.text = package.travelDate
            self.packagePrice.text = "R$ \(package.travel.price)"
        }
    }

    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func tallScroll(notification: Notification){
        self.principalScroll.contentSize = CGSize(width: self.principalScroll.frame.width, height: self.principalScroll.frame.height + 250)
    }
    
    @objc func shortScroll(notification: Notification){
        self.principalScroll.contentSize = CGSize(width: self.principalScroll.frame.width, height: self.principalScroll.frame.height)
    }
    
    @IBAction func textFieldExpirationDateBegin(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    }
    
    @IBAction func textFieldExpirationDateEnd(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
    }

    @objc func exibeDataTextField(sender: UIDatePicker) {
        let formatador = DateFormatter()
        formatador.dateFormat = "dd/MM/yyyy"
        self.expirationDate.text = formatador.string(from: sender.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
