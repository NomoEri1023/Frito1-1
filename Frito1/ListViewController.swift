//
//  ListViewController.swift
//  Frito1
//
//  Created by 野本エリカ on 2018/05/03.
//  Copyright © 2018年 Life is Tech!. All rights reserved.
//

import UIKit
import TabPageViewController

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let contents = ["aa", "bb", "cc"] // 表示するコンテンツ
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // コンテンツ内容よりも多くのCellのセパレータを表示しないための処理
        tableView.tableFooterView = UIView()
    }
    
}

extension ListViewController: UITableViewDelegate {
    
    // こちらのメソッドでindexPathで指定されたCell毎のRowAction配列を設定します
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: IndexPath)
        -> [AnyObject]? {
            let editAction =
                UITableViewRowAction(style: .normal, // 削除等の破壊的な操作を示さないスタイル
                title: "edit"){(action, indexPath) in print("\(indexPath) edited")}
            editAction.backgroundColor = UIColor.green
            let deleteAction =
                UITableViewRowAction(style: .default, // 標準のスタイル
                title: "delete"){(action, indexPath) in print("\(indexPath) deleted")}
            deleteAction.backgroundColor = UIColor.red
            return [editAction, deleteAction]
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            // モジュール名.クラス名をCellIdentifierとして使用しているため、MYTableViewCell.self.description()でその文字列を取得
            var cell =
                tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.self.description(),
                                              for: indexPath) as! ListTableViewCell
            cell.nameLabel.text = contents[indexPath.row]
            return cell
    }
    
    // エディット機能の提供に必要なメソッド
    func tableView(tableView: UITableView,
                   commitEditingStyle editingStyle: UITableViewCellEditingStyle,
                   forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}

