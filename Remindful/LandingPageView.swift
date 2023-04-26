import UIKit

class LandingPageView: UIViewController {
    
    @IBOutlet weak var getStarted: UIButton!
    
    override func viewDidLoad() {
            super.viewDidLoad()

            // Update the button's size
            getStarted.frame.size = CGSize(width: 300, height: 80)
        
            // Create horizontal and vertical centering constraints
            let centerXConstraint = NSLayoutConstraint(item: getStarted!, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
            let centerYConstraint = NSLayoutConstraint(item: getStarted!, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: view.frame.height/2 - 100 - 25)


            let widthConstraint = NSLayoutConstraint(item: getStarted!, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)
            let heightConstraint = NSLayoutConstraint(item: getStarted!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 50)

            // Add the constraints to the view
            view.addConstraints([centerXConstraint, centerYConstraint, widthConstraint, heightConstraint])
        }
    
    @IBAction func getToHabits(_ sender: UIButton) {
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: "TabBarController")
        
        
//        self.present(tabBarController, animated: false, completion: nil)
        UIApplication.shared.windows.first?.rootViewController = tabBarController
    }
    
    //user defaults -> to get view to show once - similar code in app delegate
    
}
