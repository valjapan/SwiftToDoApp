//
//  ViewController.swift
//  ToDoApp
//
//  Created by 鍋島 由輝 on 2019/02/18.
//  Copyright © 2019 ValJapan. All rights reserved.
//

import UIKit

//クラスの継承を追
class ViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource{
    //変数を宣言する
    var todo = [String]()
    
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return todo.count
    }
    
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let todoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        todoCell.textLabel!.text = todo[indexPath.row]
        //戻り値の設定（表示する中身)
        return todoCell
    }
    
    
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            todo = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // アイテム削除処理
        todo.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        UserDefaults.standard.set(todo, forKey: "TodoList")
        tableView.reloadData()
        
    }
    
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

