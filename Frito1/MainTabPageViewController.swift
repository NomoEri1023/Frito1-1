//
//  TabPageViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/03.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import TabPageViewController


class MainTabPageViewController: TabPageViewController {
    
    
    override init() {
        super.init()
        
        let tc = storyboard?.instantiateViewController(withIdentifier: "pageView") as! PagenewViewController
        
        let vc1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ListViewController")
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor(red: 252/255, green: 150/255, blue: 149/255, alpha: 1.0)
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor(red: 149/255, green: 218/255, blue: 252/255, alpha: 1.0)
        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor(red: 149/255, green: 252/255, blue: 197/255, alpha: 1.0)
        let vc5 = UIViewController()
        vc5.view.backgroundColor = UIColor(red: 252/255, green: 182/255, blue: 106/255, alpha: 1.0)
        tabItems = [(vc1, "肉"), (vc2, "魚介"), (vc3, "卵・乳製品"), (vc4, "野菜類"), (vc5, "果物")]
        isInfinity = true
        option.currentColor = UIColor(red: 246/255, green: 175/255, blue: 32/255, alpha: 1.0)
        option.tabMargin = 30.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
