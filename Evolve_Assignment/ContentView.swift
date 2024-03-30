//
//  ContentView.swift
//  Evolve_Assignment
//
//  Created by Smit Patel on 30/03/24.
//

import SwiftUI



struct ContentView: View {
    
    
    @State private var isPressed = false
    @State private var selectedEmoji: String?
    let emojis = ["😩", "☹️", "🙂", "😊", "😃"]
    
    var body: some View {
        ZStack
        {
            
            Color(.black)
                .ignoresSafeArea()
            
            VStack
            {
                
                Spacer()
                
                ZStack
                {
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color("blue1"))
                    
                    Toggle(isOn: $isPressed) {
                        Text("How are you?")
                            .foregroundColor(isPressed ? .white : .gray)
                    }
                    .toggleStyle(SwitchToggleStyle(tint: .blue))
                    .padding()
                }
                .frame(height:70)
                .padding()
                
                
                Spacer()
                
                
                //used cream color as background instead of white
                
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.cream)
                    
                    VStack(alignment: .leading) 
                    {
                        HStack{
                            Text("11 Aug")
                                .fontWeight(.semibold)
                                .frame(width: 40, alignment: .leading)
                            
                            Text("how was your day?✏️")
                                .fontWeight(.semibold)
                                .padding(.bottom,20)
                        }
                        .padding(.top,30)
                        .padding(.leading, 20)
                        .padding(.bottom, 20)
                        
                        Spacer()
                        
                        HStack{
                            ForEach(emojis, id: \.self) { emoji in
                                EmojiButton(emoji: emoji, isSelected: emoji == selectedEmoji) {
                                    if selectedEmoji == emoji {
                                        selectedEmoji = nil
                                    } else {
                                        selectedEmoji = emoji
                                    }
                                }
                            }
                        }.padding()
                    }
                }
                .frame(height: 200)
                
                
                Spacer()
            }
        }
    }
}

struct EmojiButton : View {
    let emoji: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        
        ZStack{
            Circle()
                .opacity(0.2)
            
            Button(action: action) {
                Text(emoji)
                    .font(.system(size: 40))
            }
            .clipShape(Circle())
            
        }
        .opacity(isSelected ? 1.0 : 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
