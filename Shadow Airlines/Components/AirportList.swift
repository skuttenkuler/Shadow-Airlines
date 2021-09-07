//
//  AirportTable.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/14/21.
//

import SwiftUI

struct AirportList: View {
    @StateObject var data = DataLoader()
    
    var body: some View {
        AirportsList(data: data)
    }
}

struct AirportTable_Previews: PreviewProvider {
    static var previews: some View {
        AirportList()
    }
}

struct AirportsList: View {
    @ObservedObject var data : DataLoader

         var body: some View {
           List{
               ForEach(data.airportData, id: \.id){ state in
                   Section(header: Text("\(state.state)")) {
                       ForEach(state.cities, id: \.id) { city in
                        Text("\(city.city)")
                       
                   }
               }
            }
        }
    }
}
