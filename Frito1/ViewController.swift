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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // ナビゲーションを透明にする処理
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
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
    
