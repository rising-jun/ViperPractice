//
//  SplashViewProtocols.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/17.
//  Copyright © 2020 김동준. All rights reserved.
//

import UIKit
protocol SplashViewProtocol: class{
    
}

protocol SplashWireFrameProtocol: class{
    static func createSpalshModule() -> UIViewController
    //presenter to wireframe
    func presentMainScreen(from view: SplashViewProtocol?, netflixlist: Array<NetflixData>,instaList: Array<String>,naverList: Array<String>)
}

protocol SplashPresenterProtocol: class{
    var view: SplashViewProtocol? {get set}
    var interactor: SplashInteractorInputProtocol? {get set}
    var wireFrame: SplashWireFrameProtocol? {get set}
    
    func viewDidLoad()
    //func showMain()
    
}

protocol SplashInteractorInputProtocol: class{
    //presenter to interactor
    var presenter: SplashInteractorOutputProtocol? {get set}
    // datamanager in,output
    func requestDatas()
}

protocol SplashInteractorOutputProtocol: class{
    func giveDatas(netflixList: Array<NetflixData>,instaList: Array<String>,naverList: Array<String>)
}
