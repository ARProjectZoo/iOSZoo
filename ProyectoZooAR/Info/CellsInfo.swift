
import UIKit

class CellsInfo: UICollectionViewCell {
    
   
    @IBOutlet weak var imgEvents: UIImageView!
    @IBOutlet weak var imgAnimals: UIImageView!
    @IBOutlet weak var imgRestaurants: UIImageView!
    
    @IBOutlet weak var titleEvents: UILabel!
    @IBOutlet weak var titleAnimals: UILabel!
    @IBOutlet weak var titleRestaurants: UILabel!
    
    func displayContent(image: UIImage, title: String) {
        imgEvents.image = image
        titleEvents.text = title
        imgAnimals.image = image
        titleAnimals.text = title
        imgRestaurants.image = image
        titleRestaurants.text = title
    }
}
