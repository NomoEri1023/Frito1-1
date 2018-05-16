//
//  List5ViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/15.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import TabPageViewController
import RealmSwift

class List5ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var myTableView5: UITableView!
    
    var FoodItems: [Shouhin] = []
    
    var Fdata: Shouhin!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView5.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        myTableView5.delegate = self
        myTableView5.dataSource = self
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // セル数を返却
        return FoodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ListTableViewCell
        
        cell.nameLabel?.text = FoodItems[indexPath.row].name
        
        cell.kazuLabel?.text = String(FoodItems[indexPath.row].number)
        
        cell.accessoryType = .detailButton
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // 選択された品名
         Fdata = FoodItems[indexPath.row]
        
        // アラートを作成
        let alert = UIAlertController(title: "編集", message: "選択してください", preferredStyle: .actionSheet)
        let buttona = UIAlertAction(title: "変更", style: UIAlertActionStyle.default, handler:
        {(action: UIAlertAction!) in
            
            // 0.5秒後に実行したい処理
            self.performSegue(withIdentifier: "edit", sender: self.Fdata)
            
        }
        )
        
        let buttonb = UIAlertAction(title: "削除", style: .destructive, handler: { (ars) in
            
            self.FoodItems.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            let realm = try! Realm()
            
            try! realm.write {
                
                realm.delete(self.FoodItems)
                
            }
        }
        )
        
        let buttonc = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        
        alert.addAction(buttona)
        alert.addAction(buttonb)
        alert.addAction(buttonc)
        // アラートを表示
        present(alert, animated: true, completion: nil)
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            let secondViewController = segue.destination as! henkouViewController
            secondViewController.Fdata = sender as! Shouhin
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 一覧取得
        let realm = try! Realm()
        let shouhins = realm.objects(Shouhin.self).filter("category == %@", "果物")
        FoodItems = []
        shouhins.forEach { item in
            FoodItems.append(item)
        }
        
        // Top画面表示時にテーブル内容をリロード
        myTableView5.reloadData()
    }
    
    
    
    
    
}
