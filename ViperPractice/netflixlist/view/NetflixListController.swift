//
//  MainViewController.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/18.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class NetflixListController: UIViewController{
    var presenter: NetflixListPresenterProtocol?
    var netflixlist: Array<NetflixData>?
    
    private lazy var movieTableView = UITableView()
    private lazy var dramaTableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        presenter?.viewDidLoad()
        
    }
    
    private func setTableViewUI(){
        self.view.addSubview(movieTableView)
        movieTableView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(40)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(view.frame.height/2-120)
        })
        
        self.view.addSubview(dramaTableView)
        dramaTableView.snp.makeConstraints({ (make) in
            make.top.equalTo(self.movieTableView.snp.bottom).offset(40)
            make.leading.equalTo(self.view).offset(20)
            make.trailing.equalTo(self.view).offset(-20)
            make.height.equalTo(view.frame.height/2-120)
        })
        
        movieTableView.dataSource = self
        movieTableView.delegate = self
        dramaTableView.dataSource = self
        dramaTableView.delegate = self
        movieTableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        dramaTableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
    }
}

extension NetflixListController: NetflixListProtocol{
    func showPost() {
        setTableViewUI()
        movieTableView.reloadData()
        dramaTableView.reloadData()
    }
}

extension NetflixListController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return netflixlist!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        if tableView == movieTableView{
            cell.textLabel?.text = netflixlist?[indexPath.row]._movie
        }else{
            cell.textLabel?.text = netflixlist?[indexPath.row]._drama
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == movieTableView{
            return "movie top10"
        }else{
            return "drama top10"
        }
    }

}
