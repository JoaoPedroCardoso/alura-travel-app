import UIKit

class TravelPackageDAO: NSObject {
    
    func returnAllTravelPackages() -> Array<TravelPackage> {
        
        let pacotePortoGalinhas = TravelPackage(hotelName: "Resort Porto de Galinhas", descriptions: "Hotel + café da manhã", travelDate: "8~15 de agosto", travel: Travel(title: "Porto de Galinhas", quantityOfDays: 7, price: "2.490,99", imagePath: "img6.jpg"))
        
        let pacoteBuzios = TravelPackage(hotelName: "Resort Buzios Spa", descriptions: "Hotel + café da manhã", travelDate: "9~16 de setembro", travel: Travel(title: "Buzios", quantityOfDays: 7, price: "1.990,99", imagePath: "img7.jpg"))
        
        let pacoteNatal = TravelPackage(hotelName: "Resort Natal Show", descriptions: "Hotel + café da manhã", travelDate: "13~18 de setembroo", travel: Travel(title: "Natal", quantityOfDays: 5, price: "1.700,00", imagePath: "img8.jpg"))
        
        let pacoteRioDeJaneiro = TravelPackage(hotelName: "Resort RJ Spa", descriptions: "Hotel + café da manhã", travelDate: "9~13 de outubro", travel: Travel(title: "Rio de Janeiro", quantityOfDays: 4, price: "2.300,00", imagePath: "img9.jpg"))
        
        let pacoteAmazonas = TravelPackage(hotelName: "Pousada Amazonas Plus", descriptions: "Hotel + café da manhã", travelDate: "9~13 de outubro", travel: Travel(title: "Amazonas", quantityOfDays: 6, price: "2.850,00", imagePath: "img10.jpg"))
        
        let pacoteSalvador = TravelPackage(hotelName: "Pousada Salvador", descriptions: "Hotel + café da manhã", travelDate: "5~10 de novembro", travel: Travel(title: "Salvador", quantityOfDays: 6, price: "1.880,90", imagePath: "img11.jpg"))
        
        let packageList:Array<TravelPackage> = [pacotePortoGalinhas, pacoteBuzios, pacoteNatal, pacoteRioDeJaneiro, pacoteAmazonas, pacoteSalvador]
        
        return packageList
    }
}








