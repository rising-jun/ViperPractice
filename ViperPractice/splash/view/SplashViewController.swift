//
//  ViewController.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/14.
//  Copyright © 2020 김동준. All rights reserved.
//

import UIKit
import SwiftSoup
class SplashViewController: UIViewController {
    
    var netflixDataArray: Array<String> = []
    var presenter: SplashPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        presenter?.viewDidLoad()
    }

}

extension SplashViewController: SplashViewProtocol{
    
}
