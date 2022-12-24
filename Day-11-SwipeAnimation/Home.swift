//
//  Home.swift
//  Day-11-SwipeAnimation
//
//  Created by Apple  on 24/12/22.
//

import SwiftUI

struct Home: View {
    //colors as tabs
    //use your own tabs here
    var colors:[Color] = [.red,.blue,.pink,.purple]
    
    @State var offset:CGFloat = 0
    var body: some View {
        ScrollView(.init()){
            TabView {
                ForEach(colors.indices,id:\.self){index in
                    
                    if index == 0{
                        colors[index]
                            .overlay(
                                //geometry Reader for getting offset....
                                GeometryReader{proxy -> Color in
                                    
                                    let minX = proxy.frame(in: .global).minX
                                    DispatchQueue.main.async {
                                        withAnimation {
                                            self.offset = -minX
                                        }
                                        
                                    }
                                    return Color.clear
                                    
                                }
                                    .frame(width:0,height: 0),alignment: .leading
                            )
                    }
                    
                    colors[index]
                    
                }
                
                
                
                
                
                
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .overlay(
                //Animation Indicators....
                HStack(spacing:15){
                    
                    ForEach(colors.indices,id:\.self){index in
                        
                        
                        
                        Capsule()
                            .fill(Color.white)
                            .frame(width: getIndex() == index  ? 20 : 7 ,height: 7)
                        
                        
                    }
                    
                }
                //showing smooth effect
                    .overlay(
                        Capsule()
                            .fill(Color.white)
                            .frame(width:  20,height: 7)
                            .offset(x:getOffset())
                        ,alignment: .leading
                        
                    )
                    .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                    .padding(.bottom,10)
                ,alignment: .bottom
                
            )
        }
        .ignoresSafeArea()
    }
    
    func getIndex()->Int{
        let index = Int(round(Double(offset/getWidth())))
        return index
    }
    
    func getOffset()->CGFloat{
        //spacing = 15
        // Circle width = 7
        //so total = 22
        
        let progress = offset/getWidth()
        return 22 * progress
    }
    
}




//exttending view to get width
extension View{
    func getWidth()->CGFloat{
        return UIScreen.main.bounds.width
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
