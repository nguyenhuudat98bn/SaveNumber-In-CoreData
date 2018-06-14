//
//  ViewController.swift
//  SaveNumber In CoreData
//
//  Created by nguyễn hữu đạt on 6/14/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberText : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            guard let number = try AppDelegate.context.fetch(Sroce.fetchRequest()) as? [Sroce] else {return}
            numberText.text = String(number.last?.number ?? 0)
        } catch  {
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveData(_ sender : UIButton){
        guard numberText.text != "" else { return }
        let sorce = Sroce(context: AppDelegate.context)
        sorce.number = Int32(numberText.text!) ?? 0
        AppDelegate.saveContext()
    }
}

