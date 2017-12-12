//
//  ConverterViewController.swift
//  Conversion Calculator
//
//  Created by Kevin Fritz on 11/5/17.
//  Copyright © 2017 Kevin Fritz. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {

    @IBOutlet weak var OutputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var convArray = [Converter]()
    var currentConverter = Converter(label: "", inputUnit: "", outputUnit: "" )
    var numbersString: String = ""
    var inputNumber: Double = 0.0
    var outputNumber: Double = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        convArray.append(Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"))
        convArray.append(Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"))
        convArray.append(Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"))
        convArray.append(Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi"))
        let defaultConvert = convArray[0]
        OutputDisplay.text = defaultConvert.outputUnit
        inputDisplay.text = defaultConvert.inputUnit
        self.currentConverter = defaultConvert
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func converterButton(_ sender: AnyObject) {
//        let alert = UIAlertController(title: "Converter", message: "Converter ", preferredStyle: UIAlertControllerStyle.actionSheet)
        let alert = UIAlertController(title: nil, message: "Choose Converter", preferredStyle: UIAlertControllerStyle.actionSheet)
        for converter in convArray{
            alert.addAction(UIAlertAction(title: converter.label, style: UIAlertActionStyle.default, handler: {
                (alertAction) -> Void in
                // handle choice A
                self.currentConverter = converter
                self.inputDisplay.text = converter.inputUnit
                self.OutputDisplay.text = converter.outputUnit
                
            }))
        }
        self.inputNumber = 0.0
        self.outputNumber = 0.0
        self.numbersString = ""
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func controlButtons(_ sender: UIButton) {
        
        switch sender.tag {
        //clear
        case 0:
            self.numbersString = ""
            inputDisplay.text = currentConverter.inputUnit
            OutputDisplay.text = currentConverter.outputUnit
        // +/-
        case 1:
            if(self.numbersString.hasPrefix("-")){
                self.numbersString.remove(at: self.numbersString.startIndex)
            }else{
                self.numbersString = "-" + self.numbersString
            }
            
        //7
        case 3:
            self.numbersString.append("7")
        //8
        case 4:
            self.numbersString.append("8")
        //9
        case 5:
            self.numbersString.append("9")
        //4
        case 6:
            self.numbersString.append("4")
        //5
        case 7:
            self.numbersString.append("5")
        //6
        case 8:
            self.numbersString.append("6")
        //1
        case 9:
            self.numbersString.append("1")
        //2
        case 10:
            self.numbersString.append("2")
        //3
        case 11:
            self.numbersString.append("3")
        //0
        case 12:
            self.numbersString.append("0")
        //.
        case 13:
            if(numbersString.contains(".")){
                return
            }
            if(numbersString.isEmpty){
                numbersString = "0."
            }
            else{
                self.numbersString.append(".")
            }
        default:
            return
        }
        
        switch currentConverter.label {
        case "fahrenheit to celcius":
            inputDisplay.text = numbersString + currentConverter.inputUnit
            if let inputNumber = Double(numbersString){
                outputNumber = convert(inputNum: inputNumber, type: currentConverter)
                OutputDisplay.text = String (outputNumber) + currentConverter.outputUnit
            }
        case "celcius to fahrenheit":
            inputDisplay.text = numbersString + currentConverter.inputUnit
            if let inputNumber = Double(numbersString){
                outputNumber = convert(inputNum: inputNumber, type: currentConverter)
                OutputDisplay.text = String (outputNumber) + currentConverter.outputUnit
            }
        case "miles to kilometers":
            inputDisplay.text = numbersString + currentConverter.inputUnit
            if let inputNumber = Double(numbersString){
                outputNumber = convert(inputNum: inputNumber, type: currentConverter)
                OutputDisplay.text = String (outputNumber) + currentConverter.outputUnit
            }
        case "kilometers to miles":
            inputDisplay.text = numbersString + currentConverter.inputUnit
            if let inputNumber = Double(numbersString){
                outputNumber = convert(inputNum: inputNumber, type: currentConverter)
                OutputDisplay.text = String (outputNumber) + currentConverter.outputUnit
            }
            
        default:
            return
        }
    }
    
    func convert(inputNum: Double, type: Converter) -> Double{
        switch currentConverter.label {
        case "fahrenheit to celcius":
            outputNumber = (inputNum - 32) * (5/9)
        case "celcius to fahrenheit":
            outputNumber = (inputNum * (9/5)) + 32
        case "miles to kilometers":
            outputNumber = inputNum * 1.60934
        case "kilometers to miles":
            outputNumber = inputNum / 1.60934
            
        default:
            return outputNumber
        }
        return outputNumber
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

