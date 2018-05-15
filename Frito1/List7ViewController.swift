//
//  List7ViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/15.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import TabPageViewController
import RealmSwift

class List7ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet var myTableView7: UITableView!
    
    var FoodItems: [Shouhin] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView7.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        myTableView7.delegate = self
        myTableView7.dataSource = self
        
        
        
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // セル数を返却
        return FoodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ListTableViewCell
        
        cell.nameLabel?.text = FoodItems[indexPath.row].name
        
        cell.accessoryType = .detailButton
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        // 選択された品名
        let sel = FoodItems[indexPath.row].name
        
        // アラートを作成
        let alert = UIAlertController(title: "編集", message: "選択してください", preferredStyle: .actionSheet)
        let buttona = UIAlertAction(title: "変更", style: UIAlertActionStyle.default, handler:
        {(action: UIAlertAction!) in
            
            //アラートが消えるのと画面遷移が重ならないように0.5秒後に画面遷移するようにしてる
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                // 0.5秒後に実行したい処理
                self.performSegue(withIdentifier: "edit", sender: nil)
            }
        }
        )
        
        
        
        let buttonb = UIAlertAction(title: "削除", style: .destructive, handler: nil)
        
        let buttonc = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        
        
        alert.addAction(buttona)
        alert.addAction(buttonb)
        alert.addAction(buttonc)
        // アラートを表示
        present(alert, animated: true, completion: nil)
        
        
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
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
        myTableView7.reloadData()
    }
    
    
    
    
    
}
