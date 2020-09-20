//
//  NaverListProtocols.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/20.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
import UIKit
protocol NaverListProtocol: class {
    var presenter: NaverListPresenterProtocol? { get set }
    func showPost()
}

protocol NaverListWireFrameProtocol: class{
    static func createMainViewModule(naverList: Array<String>) -> UIViewController
    //presenter to wireframe
}

protocol NaverListPresenterProtocol: class{
    var view: NaverListProtocol?{get set}
    var interactor: NaverListInteractorInputProtocol?{get set}
    var wireFrame: NaverListWireFrameProtocol? {get set}
    func viewDidLoad()
}

protocol NaverListInteractorInputProtocol: class{
    var presenter: NaverListInteractorOutputProtocol?{get set}
    func requestData()
    //request something
    
}
protocol NaverListInteractorOutputProtocol: class{
    func giveData()
}
