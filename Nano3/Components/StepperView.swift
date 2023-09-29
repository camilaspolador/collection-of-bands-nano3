//
//  StepperView.swift
//  Nano3
//
//  Created by Camila Spolador on 27/09/23.
//

import SwiftUI

struct StepperView: View {
    
    @State private var value = 0
    
    func incrementStep() {
        value += 1
        if value >= 5 {
            value = 5
        }
    }
    
    
    func decrementStep() {
        value -= 1
        if value < 0 { value = 0 }
    }
    
    var body: some View {
        
        Section {
            Stepper {
                StarsHStackView(starsCount: value)
                    .foregroundColor(.pink)
            } onIncrement: {
                incrementStep()
            } onDecrement: {
                decrementStep()
            }
            
        } header: {
            Text("Score for the performance")
        }
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            StepperView()
        }
    }
}
