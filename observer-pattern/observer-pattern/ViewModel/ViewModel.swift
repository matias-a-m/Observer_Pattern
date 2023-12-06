//
//  ViewModel.swift
//  observer-pattern
//
//  Created by matias on 06/12/2023.
//

import UIKit
import Combine

class ViewModel{
    
    // Subject/Observable
    var title = PassthroughSubject<String, Error>()
    
    @Published var color: UIColor = .black
    
    func updateTitle(title: String){
        self.title.send(title)
        
        let colors: [UIColor] = [.systemIndigo, .systemPink, .systemYellow, .systemTeal, .systemMint]
        color = colors[Int.random(in: 0..<colors.count)]
        
    }
    
}
