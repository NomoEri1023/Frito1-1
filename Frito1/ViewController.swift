//
//  ViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/01.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import TabPageViewController

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func FridgeCheck(_ sender: Any) {
    
    
        let tc = storyboard?.instantiateViewController(withIdentifier: "pageView") as! PagenewViewController
        
        
        
        let nc = UINavigationController()
        nc.viewControllers = [tc]
        
        var option = TabPageOption()
        option.currentColor = UIColor(red: 246/255, green: 175/255, blue: 32/255, alpha: 1.0)
        tc.option = option
        navigationController?.pushViewController(tc, animated: true)
    }
}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


