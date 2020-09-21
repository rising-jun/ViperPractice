//
//  NaverList.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/20.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
class NaverListController: UIViewController{
    var naverList: Array<String> = []
    var presenter: NaverListPresenterProtocol?
    
    private lazy var naverTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setTableViewUI()
    }
    
    private func setTableViewUI(){
        self.view.addSubview(naverTableView)
        naverTableView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(view.frame.height - 200)
        })
        naverTableView.dataSource = self
        naverTableView.delegate = self
        naverTableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        
    }
}

extension NaverListController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return naverList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell",for: indexPath)
        cell.textLabel?.text = naverList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "naver top Keyword"
    }
    
}

extension NaverListController: NaverListProtocol{
    func showPost() {
        naverTableView.reloadData()
    }
}
