//
//  ViewController.swift
//  observer-pattern
//
//  Created by matias on 06/12/2023.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel = ViewModel()
    
    var anyCancellable: [AnyCancellable] = []
    
    var timer: Timer?
    
    var count: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        subscriptions()
        
        self.timer = Timer(timeInterval: 1, target: self, selector: #selector(self.updateTitle), userInfo: nil, repeats: true)
    
        RunLoop.current.add(timer!, forMode: .common)
        
    }
                 
    @objc func updateTitle(){
        count += 1
        print("Count: ", count)
        if count > 5{
            anyCancellable.removeAll()
        }
        
        viewModel.updateTitle(title: "Nuevo título \(count)")
    }
                           

    
    func subscriptions(){
        
        viewModel.title.sink { _ in } receiveValue: { [weak self] title in
            // Código que reacciona a los cambios
            self?.titleLabel.text = title
        }.store(in: &anyCancellable)
        
        viewModel.$color.sink{ color in
            self.view.backgroundColor = color
            
        }.store(in: &anyCancellable)
        
    }
    

}

