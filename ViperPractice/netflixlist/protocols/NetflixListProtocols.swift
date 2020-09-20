//
//  MainViewProtocols.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/18.
//  Copyright © 2020 김동준. All rights reserved.
//

import UIKit

protocol NetflixListProtocol: class {
    var presenter: NetflixListPresenterProtocol? { get set }
    func showPost()
}

protocol NetflixListWireFrameProtocol: class{
    static func createMainViewModule(netflixlist: Array<NetflixData>) -> UIViewController
    //presenter to wireframe
}

protocol NetflixListPresenterProtocol: class{
    var view: NetflixListProtocol?{get set}
    var interactor: NetflixListInteractorInputProtocol?{get set}
    var wireFrame: NetflixListWireFrameProtocol? {get set}
    func viewDidLoad()
}

protocol NetflixListInteractorInputProtocol: class{
    var presenter: NetflixListInteractorOutputProtocol?{get set}
    func requestData()
    //request something
    
}
protocol NetflixListInteractorOutputProtocol: class{
    func giveData()
}


