import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableTravel: UITableView!
    @IBOutlet weak var flightsView: UIView!
    @IBOutlet weak var packagesView: UIView!
    
    let flightsList:Array<Travel> = TravelDAO().returnAllTravels()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableTravel.dataSource = self
        self.tableTravel.delegate = self
        self.packagesView.layer.cornerRadius = 10
        self.flightsView.layer.cornerRadius = 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flightsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let travel = flightsList[indexPath.row]
        
        cell.titleLabel.text = travel.title
        cell.quantityOfDaysLabel.text = "\(travel.quantityOfDays) days"
        cell.priceLabel.text = "R$: \(travel.price)"
        cell.imageTravel.image = UIImage(named: travel.imagePath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
}
