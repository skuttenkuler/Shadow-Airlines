//
//  BookTicketView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//
import SwiftUI
import UIKit

struct BookTicketView: View {
    var body: some View {
        VStack{
            BookTicketContent()
    }
}

struct BookTicketContent: View {
    //variables
    @StateObject var data = DataLoader()
    @State private var isModal = false
    @State var departure = Date()
    @State var destination = "San Francisco"

       //view block
       var body: some View {
           //Modal Destination
        Button(destination){
            self.isModal = true
        }.sheet(isPresented: $isModal, content: {
            //AirportsList
            AirportList(data: self.data, destination: $destination, isPresented: $isModal)
        })
           //Origin
           //Destination
           //Departure Date
           DatePicker("Departure", selection: $departure, in: Date()...)
           //logic to get data and pass to next view
           //Navigation Link to ticket
           Spacer()
        NavigationLink(destination:TicketView(destination: self.$destination, departure: self.$departure), label: {
               Text("BOOK FLIGHT")
                   .font(.system(size:60))
                   .foregroundColor(Color.white)
                   .background(Color.blue)
                   .cornerRadius(20)
                   
           })
           }
       }
   }

struct AirportList: View {
    @ObservedObject var data : DataLoader
    @Binding var destination: String
    @Binding var isPresented: Bool
         var body: some View {
            List{
               ForEach(data.airportData, id: \.id){ state in
                   Section(header: Text("\(state.state)")) {
                       ForEach(state.cities, id: \.id) { city in
                        Text("\(city.city)").onTapGesture {
                            destination = city.city
                            print("selected: \(destination)")
                            self.isPresented.toggle()
                       }
                       }
               }
            }
        }
    
    }
}
