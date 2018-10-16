import UIKit

class PackagesTravelsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UICollectionViewDelegate {

    @IBOutlet weak var collectionPackagesTravel: UICollectionView!
    let listWithAllFlights: Array<TravelPackage> = TravelPackageDAO().returnAllTravelPackages()
    var listFlights: Array<TravelPackage> = []
    
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
        
        let travelPackage = listFlights[indexPath.item]
        packageCell.configCell(travelPackage)
        
        return packageCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listFlights.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.bounds.width / 2) - 10, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let package = listFlights[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "travelDatails") as! TravelDetailsViewController
        viewController.packageSelected = package
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listFlights = listWithAllFlights
        
        if searchText != "" {
            let listTravelFilter: NSPredicate = NSPredicate(format: "self.travel.title contains[c] %@", searchText)
            
            let filterList = (listWithAllFlights as NSArray).filtered(using: listTravelFilter) as! Array<TravelPackage>
            listFlights = filterList
        }
        
        self.packagesCountLabel.text = self.updatePackageCountLabel()
        collectionPackagesTravel.reloadData()
    }
    
    func updatePackageCountLabel() -> String {
        return listFlights.count == 1 ? "1 package found" : "\(listFlights.count) packages founds "
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
