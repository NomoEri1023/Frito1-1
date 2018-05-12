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
    
    @IBOutlet weak var tableView: UITableView!

    
    
    var shouhinItem: [Shouhin] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        do{
            let realm = try! Realm()
            shouhinItem = realm.objects(Shouhin.self)
            tableView.reloadData()
        } catch {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        return cell
    }
    
    // 追加 画面が表示される際などにtableViewのデータを再読み込みする
    func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let realm = try! Realm()
        let shouhinItemObj = realm.objects(Shouhin.self)
        shouhinItem = []
        shouhinItemObj.forEach { item in
            shouhinItem.append(item)
            tableView.reloadData()
            
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                // セル数を返却
                return shouhinItem.count
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
                // itemNameをセルに表示
                cell.textLabel?.text = shouhinItem [indexPath.row].itemName
                return cell
            }
            
        }
        
        
        
        
        
        
        func save() {
            do {
                let realm = try! Realm()
                try realm.write {
                    realm.add(self.myshouhin)
                }
                
            } catch {
                
            }
            
        }
        
        func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            
            
            if(editingStyle == UITableViewCellEditingStyle.delete) {
                do{
                    let realm = try Realm()
                    try realm.write {
                        realm.delete(self.shouhinItem[indexPath.row])
                    }
                    tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.fade)
                }catch{
                }
                tableView.reloadData()
            }
        }
        
    }
    
    
    
    
    
}
