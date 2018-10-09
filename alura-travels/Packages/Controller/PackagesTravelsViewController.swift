import UIKit

class PackagesTravelsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    @IBOutlet weak var collectionPackagesTravel: UICollectionView!
    let listWithAllFlights: Array<Travel> = TravelDAO().returnAllTravels()
    var listFlights: Array<Travel> = []
    
    @IBOutlet weak var packagesCountLabel: UILabel!
    @IBOutlet weak var searchTravel: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listFlights = listWithAllFlights
        collectionPackagesTravel.dataSource = self
        collectionPackagesTravel.delegate = self
        searchTravel.delegate = self
        self.packagesCountLabel.text = self.updatePackageCountLabel()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let packageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "packageCell", for: indexPath) as! PackagesTravelsCollectionViewCell
        
        let travel = listFlights[indexPath.item]
        
        packageCell.titleLabel.text = travel.title
        packageCell.quantityOfDaysLabel.text = "\(travel.quantityOfDays) days"
        packageCell.priceLabel.text = "from R$ \(travel.price)"
        packageCell.imageTravel.image = UIImage(named: travel.imagePath)
        
        packageCell.layer.borderWidth = 0.5
        packageCell.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        
        packageCell.layer.cornerRadius = 10
        packageCell.layer.masksToBounds = true
        
        return packageCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listFlights.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width / 2) - 10, height: 160)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listFlights = listWithAllFlights
        
        if searchText != "" {
            let listTravelFilter: NSPredicate = NSPredicate(format: "self.title contains[c] %@", searchText)
            
            let filterList = (listWithAllFlights as NSArray).filtered(using: listTravelFilter) as! Array<Travel>
            
            listFlights = filterList
        }
        self.packagesCountLabel.text = self.updatePackageCountLabel()
        collectionPackagesTravel.reloadData()
    }
    
    func updatePackageCountLabel() -> String {
        return listFlights.count == 1 ? "1 package found" : "\(listFlights.count) packages founds "
    }
}
