import SwiftUI

struct ContentView: View {
    @State private var inputLength = 0.0

    @State private var selectedInputUnit = "Pikometer"
    @State private var selectedOutputUnit = "Nanometer"
    
    let units = ["Pikometer", "Nanometer", "Mikrometer", "Milimeter", "Centimeter", "Meter", "Kilometer"]
    
    let unitConversion = [
            "Picometer": UnitLength.picometers,
            "Nanometer": UnitLength.nanometers,
            "Micrometer": UnitLength.micrometers,
            "Milimeter": UnitLength.millimeters,
            "Centimeter": UnitLength.centimeters,
            "Meter": UnitLength.meters,
            "Kilometer": UnitLength.kilometers
            ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section ("Input Your Unit"){
                    TextField("Amount", value: $inputLength, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Please choose input unit", selection: $selectedInputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                    
                    Picker("Please choose output unit", selection: $selectedOutputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section ("Output your unit"){
                    
                    
                    
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
