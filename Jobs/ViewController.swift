//
//  ViewController.swift
//  Jobs
//
//  Created by Егор Рябчук on 25/03/2019.
//  Copyright © 2019 Егор Рябчук. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var jobString: String?
    
    @IBOutlet weak var textFieldJob: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonSearch(_ sender: Any) {
        /*...*/
    }
    
    //Пересылаем текст поисковой строки как параметр для
    //конфигурирования поисковой строки и загрузки данных
    override func prepare (for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "btnSendSegue") {
            let jvc = segue.destination as! JobViewController
            jvc.jobForURL = textFieldJob.text
        }
    }
    
}

