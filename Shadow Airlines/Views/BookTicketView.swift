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
    }.background(LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .top, endPoint: .bottom).frame(width: UIScreen.main.bounds.width, height:1000))
        
}

struct BookTicketContent: View {
    //variables
    @StateObject var data = DataLoader()
    @State private var isModal = false
    @State var departure = Date()
    @State var destination = "DESTINATION"
    
       //view block
       var body: some View {
       
           //Modal Destination
        VStack{
            Text("Select Destination:").foregroundColor(Color.white).font(.system(size: 25))
        Button(destination){
            self.isModal = true
        }.sheet(isPresented: $isModal, content: {
            //AirportsList
            AirportList(data: self.data, destination: $destination, isPresented: $isModal)
        })
        }.font(.system(size:22))
        .frame(width: 300, height: 100)
        .foregroundColor(Color.black)
        .background(Color(red: 203 / 255,green: 33 / 255 ,blue: 39 / 255))
        .cornerRadius(20)
        .shadow(color: .black, radius: 4, x: 10, y: 10)
        Spacer().frame(height: 50)
        VStack{
            Text("Choose Departure:").font(.system(size: 25))
            DatePicker("", selection: $departure, in: Date()...)
                .colorMultiply(Color.black).font(.system(size:40)).offset(x:-40)
        }.frame(width: 300, height: 100)
        .foregroundColor(Color.white)
        .background(Color(red: 203 / 255,green: 33 / 255 ,blue: 39 / 255))
        .cornerRadius(20)
        .shadow(color: .black, radius: 4, x: 10, y: 10)
        
           
           //logic to get data and pass to next view
           //Navigation Link to ticket
           Spacer()
        NavigationLink(destination:TicketView(destination: self.$destination, departure: self.$departure), label: {
               Text("BOOK FLIGHT")
                .font(.system(size:40))
                .frame(width: 300, height: 100)
                .foregroundColor(Color.white)
                .background(Color(red: 203 / 255,green: 33 / 255 ,blue: 39 / 255))
                .cornerRadius(20)
                .shadow(color: .black, radius: 2, x: 10, y: 10)
                   
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
                            destination = city.city + " (" + city.code + ")"
                            //print("selected: \(destination)")
                            self.isPresented.toggle()
                       }
                       }
               }
            }
        }
    
    }
}
