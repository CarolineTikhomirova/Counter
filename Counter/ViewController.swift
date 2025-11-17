//
//  ViewController.swift
//  Counter
//
//  Created by Caroline on 15.11.2025.
//

import UIKit

class ViewController: UIViewController {
    private var counter = 0

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterButtonUp: UIButton!
    @IBOutlet weak var counterButtonDown: UIButton!
    @IBOutlet weak var crearButton: UIButton!
    @IBOutlet weak var dataTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "Значение счетчика 0"
        counterButtonUp.tintColor = .red
        counterButtonDown.tintColor = .blue
        dataTextView.text = "История изменений:"
    }
    
    private func changeCounterNumber(newNumber: Int) {
        counterLabel.text = "Значение счетчика \(newNumber)"
    }
    
    private func getCurrentDataTimeString() -> String {
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter.string(from: date)
    }
    
    private func addNewDataLine(message: String){
        let timestamp = getCurrentDataTimeString()
        dataTextView.text += "\n" + "\(timestamp) \(message)"
        let bottom = NSRange(location: dataTextView.text.count - 1, length: 1)
        dataTextView.scrollRangeToVisible(bottom)
    }

    @IBAction func counterButtonUpDidTap(_ sender: Any) {
        counter += 1
        changeCounterNumber(newNumber: counter)
        addNewDataLine(message: "значение изменено на +1")
    }
    
    @IBAction func counterButtonDownDidTap(_ sender: Any) {
        if counter == 0 {
            counter = 0
            addNewDataLine(message: "попытка уменьшить значение счётчика ниже 0")
        } else {
            counter -= 1
            addNewDataLine(message: "значение изменено на -1")
        }
        changeCounterNumber(newNumber: counter)
    }
    @IBAction func crearButtonDidTap(_ sender: Any) {
        counter = 0
        changeCounterNumber(newNumber: counter)
        addNewDataLine(message: "значение сброшено")
    }
}

