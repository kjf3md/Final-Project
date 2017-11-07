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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        convArray.append(Converter(label: "fahrenheit to celcius", inputUnit: "°F", outputUnit: "°C"))
        convArray.append(Converter(label: "celcius to fahrenheit", inputUnit: "°C", outputUnit: "°F"))
        convArray.append(Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"))
        convArray.append(Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi"))
        let defaultConvert = convArray[0]
        OutputDisplay.text = defaultConvert.outputUnit
        inputDisplay.text = defaultConvert.inputUnit
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
                self.inputDisplay.text = converter.inputUnit
                self.OutputDisplay.text = converter.outputUnit
                
            }))
        }
        self.present(alert, animated: true, completion: nil)
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
