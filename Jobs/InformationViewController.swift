import UIKit

//Отображение подробной информации по вакансии
//Теги, содержащиеся в description обрезаются
class InformationViewController: UIViewController{
    var job: Job?
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var companyL: UILabel!
    @IBOutlet weak var createdL: UILabel!
    @IBOutlet weak var descriptionL: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = job!.title
        
        companyL.text = "Company:"
        createdL.text = "Created At:"
        descriptionL.text = "Description:"
        
        self.companyLabel.text = job!.company
        self.createdLabel.text = job!.createdAt
        setNeedsStatusBarAppearanceUpdate()
        //Организация прокрутки для поля Description, так как весь текст не помещается
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: descriptionLabel.bottomAnchor).isActive = true
    
        self.descriptionLabel.text = job!.description?.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        self.descriptionLabel.numberOfLines = 0
        self.descriptionLabel.sizeToFit()
        self.createdLabel.numberOfLines = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}
