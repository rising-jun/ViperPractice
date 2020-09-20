//
//  NaverList.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/20.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
import UIKit

class NaverListController: UIViewController{
    var naverList: Array<String> = []
    var presenter: NaverListPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}

extension NaverListController: NaverListProtocol{
    func showPost() {
        
    }
}
