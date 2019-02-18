//
//  ViewController.swift
//  ToDoApp
//
//  Created by 鍋島 由輝 on 2019/02/18.
//  Copyright © 2019 ValJapan. All rights reserved.
//

import UIKit

//クラスの継承を追
class ViewController: UIViewController,UITabBarDelegate,UITableViewDataSource {
    var todo = [String]()
    
    //テーブルビューインスタンス
    private var tableView:UITableView!
    
    //テーブルビューに表示する配列
    private var myItems:Array<String>!

    
    
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return todo.count
    }
    
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //変数を作る
        let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
        //変数の中身を作る
        TodoCell.textLabel!.text = todo[indexPath.row]
        //戻り値の設定（表示する中身)
        return TodoCell
    }
    
    //Mark: テーブルビューのセルが押されたら呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番のセルを選択しました！ ")
    }
    
    //Mark: セルの編集ができるようにする。
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myItems.remove(at: indexPath.row)
            todo.remove(at: indexPath.row)
            UserDefaults.standard.set(todo, forKey: "TodoList")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    //最初からあるコード
    override func viewDidLoad() {
        super.viewDidLoad()
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            todo = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        }
        
        //テーブルビューに表示する配列
        myItems = todo
        
        //テーブルビューの初期化
        tableView = UITableView()
        
//        //デリゲートの設定
//        tableView.delegate = self as? UITableViewDelegate
//        tableView.dataSource = self
        
        //テーブルビューの大きさの指定
        tableView.frame = self.view.frame
        
        //テーブルビューの設置
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)

    }
    
    //最初からあるコード
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

