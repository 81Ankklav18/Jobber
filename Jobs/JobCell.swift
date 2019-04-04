//
//  JobCell.swift
//  Jobs
//
//  Created by Егор Рябчук on 28/03/2019.
//  Copyright © 2019 Егор Рябчук. All rights reserved.
//

import UIKit

//Организация ячейки в TableView
class JobCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    
    
    var job: Job? {
        didSet {
            guard let job = job else { return }
            
            titleLabel.text = job.title
            locationLabel.text = job.location
            if job.companyLogo != nil{
                downloadImage(from: job.companyLogo!)
            }
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        //print("Download Started")
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            //print("Download Finished")
            DispatchQueue.main.async() {
                self.logoImageView!.image = UIImage(data: data)
            }
        }
    }
}
