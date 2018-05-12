//
//  ListViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/03.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import TabPageViewController
import RealmSwift

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var myTableView: UITableView!
    var FoodItems: [Shouhin] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // セル数を返却
        return FoodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        // itemNameをセルに表示
        cell.textLabel?.text = FoodItems[indexPath.row].name
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 一覧取得
        let realm = try! Realm()
        let shouhins = realm.objects(Shouhin.self)
        FoodItems = []
        shouhins.forEach { item in
            FoodItems.append(item)
        }
        
        // Top画面表示時にテーブル内容をリロード
        myTableView.reloadData()
    }
    
    
}
