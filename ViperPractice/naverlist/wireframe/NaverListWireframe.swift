//
//  NaverListWireframe.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/20.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
import UIKit
class NaverListWireframe: NaverListWireFrameProtocol{
    static func createMainViewModule(naverList: Array<String>) -> UIViewController {
        let naverListController = NaverListController()
        let preseneter: NaverListPresenterProtocol = NaverListPresenter()
        let wireFrame: NaverListWireFrameProtocol = NaverListWireframe()
        
        naverListController.presenter = preseneter
        naverListController.naverList = naverList
        preseneter.view = naverListController
        preseneter.wireFrame = wireFrame
        return naverListController
    }
    
    
}
