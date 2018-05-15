//
//  PagenewViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/05.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import TabPageViewController
import RealmSwift

class PagenewViewController: TabPageViewController {
    
    var addBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController")
        vc1.view.backgroundColor = UIColor(red: 251/255, green: 252/255, blue: 149/255, alpha: 1.0)
        let vc2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List2ViewController")
        vc2.view.backgroundColor = UIColor(red: 149/255, green: 218/255, blue: 252/255, alpha: 1.0)
        let vc3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List3ViewController")
        vc3.view.backgroundColor = UIColor(red: 244/255, green: 211/255, blue: 94/255, alpha: 1.0)
        let vc4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List4ViewController")
        vc4.view.backgroundColor = UIColor(red: 149/255, green: 252/255, blue: 197/255, alpha: 1.0)
        let vc5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List5ViewController")
        vc5.view.backgroundColor = UIColor(red: 252/255, green: 182/255, blue: 106/255, alpha: 1.0)
        let vc6 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List6ViewController")
        vc6.view.backgroundColor = UIColor(red: 8/255, green: 61/255, blue: 119/255, alpha: 1.0)
        let vc7 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List7ViewController")
        vc7.view.backgroundColor = UIColor(red: 8/255, green: 61/255, blue: 119/255, alpha: 1.0)
        let vc8 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List8ViewController")
        vc8.view.backgroundColor = UIColor(red: 8/255, green: 61/255, blue: 119/255, alpha: 1.0)
        let vc9 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List9ViewController")
        vc9.view.backgroundColor = UIColor(red: 8/255, green: 61/255, blue: 119/255, alpha: 1.0)
        let vc10 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List10ViewController")
        vc10.view.backgroundColor = UIColor(red: 8/255, green: 61/255, blue: 119/255, alpha: 1.0)
        let vc11 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "List11ViewController")
        vc11.view.backgroundColor = UIColor(red: 8/255, green: 61/255, blue: 119/255, alpha: 1.0)
        
        
        tabItems = [(vc1, "肉"), (vc2, "魚介"), (vc3, "卵・乳製品"), (vc4, "野菜類"), (vc5, "果物"), (vc6, "加工食品"), (vc7, "穀類"), (vc8, "調味料"), (vc9, "惣菜"), (vc10, "飲料"), (vc11, "菓子")]
        isInfinity = true
        
        super.viewDidLoad()
        
        self.title = "一覧"
        
        addBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(PagenewViewController.addBtnTapped(_:)) )
        self.navigationItem.rightBarButtonItem = addBtn
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func addBtnTapped(_ sender: UIBarButtonItem) {
        
        let ad = storyboard?.instantiateViewController(withIdentifier: "add") as! AddViewController
        
        navigationController?.pushViewController(ad, animated: true)
        
        
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
