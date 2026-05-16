import SwiftUI

struct MainView: View {
    @StateObject var viewModel = TradeoffsViewModel()

    var body: some View {
        VStack(spacing: 32.0) {
            Text("Pick 2")
                .font(.largeTitle.bold())

            ZStack {
                circle(for: .fast, color: .red)
                    .offset(x: Constants.circleHeight * 0.45, y: Constants.circleHeight * 0.45)
                
                circle(for: .cheap, color: .green)
                    .offset(x: -Constants.circleHeight * 0.45, y: Constants.circleHeight * 0.45)
                
                circle(for: .good, color: .blue)
                    .offset(x: 0, y: -Constants.circleHeight * 0.35)
            }
            .frame(
                width: Constants.circleWidth + 120,
                height: Constants.circleHeight + 120
            )

            Text(viewModel.tradeoffMessage ?? " ")
                .font(.title2.weight(.semibold))
                .foregroundStyle(.secondary)
                .frame(minHeight: 30)
                .padding(.vertical, 16.0)
        }
        .padding()
    }

    private func circle(for option: Option, color: Color) -> some View {
        let selected = viewModel.isSelected(option)
        return Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                viewModel.toggle(option)
            }
        } label: {
            ZStack {
                Circle()
                    .fill(color.opacity(selected ? 1.0 : 0.45))
                    .blendMode(.difference)
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: selected ? 2 : 0)
                    )
                    .shadow(radius: selected ? 10 : 0)

                Text(option.rawValue)
                    .font(.title)
                    .foregroundStyle(.white)
            }
            .frame(
                width: Constants.circleWidth,
                height: Constants.circleHeight
            )
            .scaleEffect(selected ? 1.1 : 1.0)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    MainView()
}
