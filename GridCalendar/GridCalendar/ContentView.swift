//
//  ContentView.swift
//  GridCalendar
//
//  Created by MAC on 01/07/22.
//

import SwiftUI

struct ContentView: View {
    
    let layout = [
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40)),
        GridItem(.fixed(40))
    ]
    
    var body: some View {
       ScrollView {
           LazyVGrid(columns: layout, pinnedViews: [.sectionHeaders]) {
               ForEach(year, id: \.name) { month in
                   Section(header: Text(verbatim: month.name).font(.headline)){
                       ForEach(month.days) { day in
                           Capsule()
                               .overlay(Text("\(day.value)").foregroundColor(.white))
                               .foregroundColor(.pink)
                               .frame(height: 40)
                       }
                   }
                }
            }
        }
    }
}

struct Day: Identifiable {
    let id = UUID()
    let value: Int
}

struct Month {
    let name: String
    let numberOfDays: Int
    var days: [Day]
    
    init(name: String, numberOfDays: Int)  {
        self.name = name
        self.numberOfDays = numberOfDays
        self.days = []
        
        for n in 1...numberOfDays {
            self.days.append(Day(value: n))
        }
    }
}

let year = [
        Month(name: "Enero", numberOfDays: 31),
        Month(name: "Febrero", numberOfDays: 28),
        Month(name: "Marzo", numberOfDays: 31),
        Month(name: "Abril", numberOfDays: 30),
        Month(name: "Mayo", numberOfDays: 31),
        Month(name: "Junio", numberOfDays: 30),
        Month(name: "Julio", numberOfDays: 31),
        Month(name: "Agosto", numberOfDays: 31),
        Month(name: "Septiembre", numberOfDays: 30),
        Month(name: "Octubre", numberOfDays: 31),
        Month(name: "Noviembre", numberOfDays: 30),
        Month(name: "Diciembre", numberOfDays: 31),
    ]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
