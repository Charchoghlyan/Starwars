//
//  SearchBar.swift
//  StarWars
//
//  Created by Sergey Charchoghlyan on 3/22/20.
//  Copyright © 2020 Sergey Charchoghlyan. All rights reserved.
//

import UIKit

class SearchBar: UISearchBar {
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var textColor: UIColor? {
        get {
            if let textField = value(forKey: "searchField") as? UITextField  {
                return textField.textColor
            } else {
                return nil
            }
        }
        set(newValue) {
            if let textField = value(forKey: "searchField") as? UITextField  {
                textField.textColor = newValue
            }
        }
    }
    
    func setImageColor(_ color: UIColor) {
        guard let textField = value(forKey: "searchField") as? UITextField, let leftView = textField.leftView as? UIImageView else {return}
        leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
        leftView.tintColor = color
    }
    
    func setBackgroundColor(_ color: UIColor) {
        for subView in self.subviews {
            for subSubView in subView.subviews {
                if let _ = subSubView as? UITextInputTraits {
                    let textField = subSubView as! UITextField
                    textField.backgroundColor = color
                    break
                }
            }
        }
    }
    
}
