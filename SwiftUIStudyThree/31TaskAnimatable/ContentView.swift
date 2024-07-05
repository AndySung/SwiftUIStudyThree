//
//  ContentView.swift
//  SwiftUIStudyThree
//
//  Created by andy on 2024/7/5.
//

import SwiftUI

struct ContentView: View {
   /* @State var progress = 0.0
    
    var body: some View {
        VStack {
            ZStack {
                ProgressRingView(progress: $progress,
                                 thickness: 30,
                                 width: 300,
                                 gradient: Gradient(colors: [.darkPurple, .lightPurple]))
                
                ProgressRingView(progress: $progress,
                                 thickness: 30,
                                 width: 235,
                                 gradient: Gradient(colors: [.darkYellow, .lightYellow]))
                
                ProgressRingView(progress: $progress,
                                 thickness: 30,
                                 width: 170,
                                 gradient: Gradient(colors: [.darkGreen, .lightGreen]))
                
                
            }
            
            HStack {
                Group {
                    Text("25%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.25
                        }
                    
                    Text("50%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.5
                        }
                    
                    Text("75%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 0.75
                        }
                    
                    Text("100%")
                        .font(.system(.headline, design: .rounded))
                        .onTapGesture {
                            self.progress = 1.0
                        }
                }
                .padding()
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                
            }
            .padding(.top, 50)
        }
    }*/
    
    @State private var overallProgress = 0.0
    @State private var taskStore = [ Task(name: "Design", progress: 0.7),
                              Task(name: "Coding", progress: 0.5),
                              Task(name: "Documentation", progress: 0.1),
                              Task(name: "Unit Testing", progress: 0.2)
                              ]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Daily Task")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
                .padding(.horizontal)
                .padding(.top)
            
            HStack {
                Text("Overall Progress")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer()
                
//                ProgressRingView(progress: $overallProgress, thickness: 12.0, width: 130.0, gradient: Gradient(colors: [.darkYellow, .lightYellow]), textColor: .darkYellow)
                
                ProgressRingView(progress: $overallProgress, thickness: 12.0, width: 130.0,gradient: Gradient(colors: [.darkYellow, .lightYellow]))
                
            }
            .padding(.all, 20)
            .background(Color.purpleBg)
            .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            .padding(.horizontal)
            
            LazyVGrid(columns: [GridItem()]) {
                ForEach(taskStore.indices, id: \.self) { index in
                    TaskProgressView(task: $taskStore[index])
                }
            }
            
            Spacer()
        }
        .onAppear {
            self.overallProgress = taskStore.reduce(0) { $0 + $1.progress } / Double(taskStore.count)
        }
        .onChange(of: taskStore, perform: { value in
            self.overallProgress = taskStore.reduce(0) { $0 + $1.progress } / Double(taskStore.count)
        })
        
    }
    
}

struct TaskProgressView: View {
    
    @Binding var task: Task
    
    var sliderColor: Color = .lightOrange
    
    private var progressText: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.percentSymbol = "%"
        
        return formatter.string(from: NSNumber(value: task.progress)) ?? ""
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(task.name)
                    .font(.system(.headline, design: .rounded))
                
                Text(progressText)
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(Color.primary.opacity(0.8))
            }
            
                HStack {
                    Text("0%")
                        .font(.system(.subheadline, design: .rounded))
                    Slider(value: $task.progress, in: 0...1, step: 0.05)
                        .accentColor(sliderColor)
                    Text("100%")
                        .font(.system(.subheadline, design: .rounded))
                }
        }
        .padding()
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
        .padding(.horizontal)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
