import UIKit

class JobViewController: UITableViewController {
    var jobForURL: String?
    var page = 0
    var fetchingMore = false
    var jobs: [Job]
    
    init(){
        self.jobs = SampleData.generateJobsData(jobSearched: "", page: self.page)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.jobs = SampleData.generateJobsData(jobSearched: "", page: self.page)
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var jobTableView: UITableView!
    
    //Загрузка 0й страницы, установка тайтла скрина
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = jobForURL
        self.jobs = SampleData.generateJobsData(jobSearched: jobForURL!, page: self.page)
        
        self.jobTableView.reloadData()
    }
    
    //Пересылка выбранной данных выбраной ячейки
    override func prepare (for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "cellSendSegue") {
            let jvc = segue.destination as! InformationViewController
            var index = jobTableView.indexPathForSelectedRow?.row
            jvc.job = self.jobs[index!]
        }
    }
}

extension JobViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobCell",
                                                 for: indexPath) as! JobCell
        
        let job = jobs[indexPath.row]
        cell.job = job
        
        return cell
    }
    
    //Организация infinite scrolling
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.frame.height{
            if !fetchingMore{
                if (SampleData.generateJobsData(jobSearched: jobForURL!, page: self.page).count != 0){
                    beginBatchFetch()
                }
            }
        }
    }
    
    //Подгрузка и добавление данных в общую коллекцию
    func beginBatchFetch(){
        //print("fetch")
        fetchingMore = true
        self.page += 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            let newItems = SampleData.generateJobsData(jobSearched: self.jobForURL!, page: self.page)
            self.jobs.append(contentsOf: newItems)
            self.fetchingMore = false
            self.jobTableView.reloadData()
            })
    }
}
