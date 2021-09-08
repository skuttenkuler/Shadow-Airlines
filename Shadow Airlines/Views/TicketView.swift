//
//  TicketView.swift
//  Shadow Airways
//
//  Created by Sam Kuttenkuler on 8/5/21.
//

import SwiftUI


struct TicketView: View {
    
    @Binding var destination: String
    @Binding var departure: Date
    
    var body: some View {
        ZStack{
            VStack{
            Text("Nashville (BNA)").offset(x: -30,y: -95).font(.system(size:25).weight(.heavy))
                Text(destination).offset(x: -50,y: -80).font(.system(size:25).weight(.heavy))
                
                Text("\(departure, style: .date)").offset(x: 35,y: 138).font(.system(size:25).weight(.heavy))
                Text("\(departure, style: .time)").offset(x: -95,y: 190).font(.system(size:25).weight(.heavy))
        Button("Book"){
            let image = snapshot()
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        }.offset(x: 0 , y: 250).frame(maxWidth:.infinity)
    }.background(
        Image("Ticket2")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .frame(width:300, height: 650)
    )}
}
}
//class DateData{
//    func stringifyDateTime(date: Date) -> String{
//            var string_date: String = ""
//            let dateFormatter = DateFormatter()
//            string_date = dateFormatter.string(from: date)
//            print(string_date)
//            return string_date
//        }
//}

//struct TicketView_Previews: PreviewProvider {
//    @Binding var destination: String
//    static var previews: some View {
//        TicketView(destination: $destination)
//    }
//}
//}
