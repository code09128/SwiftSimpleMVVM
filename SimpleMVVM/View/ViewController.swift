//
//  ViewController.swift
//  SimpleMVVM
//
//  Created by Dustin on 2022/5/11.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    lazy var viewModel = {
        ViewModel()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        initViewModel()
    }
    
    /**建立初始化資料*/
    func initViewModel(){
        viewModel.getEmployees()
        
        viewModel.reloadTableView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    /**每組共有多少列*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellViewModels.count
    }
    
    /**設定Cell內容*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "ItemViewCell", for : indexPath) as! TableViewCell
                
        let cellVM = viewModel.getCellViewModel(indexPath: indexPath)
        cell.cellViewModel = cellVM
        
        return cell
    }
}

