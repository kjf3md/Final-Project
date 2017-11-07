//
//  ConverterStruct.swift
//  Conversion Calculator
//
//  Created by Kevin Fritz on 11/5/17.
//  Copyright © 2017 Kevin Fritz. All rights reserved.
//

import Foundation


struct Converter {
    let label: String
    let inputUnit: String
    let outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String) {
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}
