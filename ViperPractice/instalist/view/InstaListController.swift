//
//  InstaListControllser.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/21.
//  Copyright © 2020 김동준. All rights reserved.
//

import UIKit
import SnapKit

class InstaListController: UIViewController{
    
    var instaList: Array<String> = []
    var presenter: InstaListPresenterProtocol?
    
    private lazy var instaTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        setTableView()
    }
    
    private func setTableView(){
        self.view.addSubview(instaTableView)
        instaTableView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(view.frame.height - 200)
        })
        
        
        instaTableView.dataSource = self
        instaTableView.delegate = self
        instaTableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
    }
    
}

extension InstaListController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell",for: indexPath)
        cell.textLabel?.text = instaList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "instaList top HashTag"
    }
    
    
}

extension InstaListController: InstaListViewProtocol{
    
}
