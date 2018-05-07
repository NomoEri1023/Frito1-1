//
//  PagenewViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/05.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import TabPageViewController

class PagenewViewController: TabPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushItem(_ sender: UIBarButtonItem) {
        print("Push Navi Item")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
