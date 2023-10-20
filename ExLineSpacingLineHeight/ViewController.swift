//
//  ViewController.swift
//  ExLineSpacingLineHeight
//
//  Created by 김종권 on 2023/10/20.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = UILabel()
        label.textAlignment = .center
        label.center = view.center
        label.numberOfLines = 0
        label.backgroundColor = .lightGray
        label.textColor = .black
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        sampleLineSpacing(with: label)
//        sampleLineHeight(with: label)
    }
    
    func sampleLineSpacing(with label: UILabel) {
        let text = "ABC\nabc"
        let attributedString = NSMutableAttributedString(string: text)
        
        // A, B, C 문자 각각에 대해 다른 lineHeight 설정
        let rangeA = (text as NSString).range(of: "A")
        let paragraphStyleA = NSMutableParagraphStyle()
        paragraphStyleA.lineSpacing = 50
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyleA, range: rangeA)
        
        let rangeB = (text as NSString).range(of: "B")
        let paragraphStyleB = NSMutableParagraphStyle()
        paragraphStyleB.lineSpacing = 10
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyleB, range: rangeB)
        
        let rangeC = (text as NSString).range(of: "C")
        let paragraphStyleC = NSMutableParagraphStyle()
        paragraphStyleC.lineSpacing = 100
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyleC, range: rangeC)
        
        let range_a = (text as NSString).range(of: "a")
        let paragraphStyle_a = NSMutableParagraphStyle()
        paragraphStyle_a.lineSpacing = 100
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle_a, range: range_a)
        
        label.attributedText = attributedString
    }
    
    // "ABC"라는 문자열이 있을때, A와 B와 C 문자열의 lineHeight가 다른 경우 어느것이 적용될까?
    func sampleLineHeight(with label: UILabel) {
        let text = "ABC"
        let attributedString = NSMutableAttributedString(string: text)
        
        // A, B, C 문자 각각에 대해 다른 lineHeight 설정
        let rangeA = (text as NSString).range(of: "A")
        attributedString.addAttribute(NSAttributedString.Key.baselineOffset, value: 5, range: rangeA)
        
        let rangeB = (text as NSString).range(of: "B")
        attributedString.addAttribute(NSAttributedString.Key.baselineOffset, value: 10, range: rangeB)
        
        let rangeC = (text as NSString).range(of: "C")
        attributedString.addAttribute(NSAttributedString.Key.baselineOffset, value: 15, range: rangeC)
        
        label.attributedText = attributedString
    }
}
