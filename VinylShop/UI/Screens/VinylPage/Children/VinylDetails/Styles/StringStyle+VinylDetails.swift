import BonMot
import UIKit

extension StringStyle {

    static var notesStyle: StringStyle {
        return StringStyle(
            .color(Color.black000000.ui()),
            .font(.from(.nunito(.semibold), ofSize: 14)),
            .lineSpacing(2)
        )
    }

    static var vinylPriceStyle: StringStyle {
        let currencyStyle = StringStyle(.font(.from(.nunito(.bold), ofSize: 14)), .baselineOffset(1))
        let priceStyle = StringStyle(.font(.from(.nunito(.bold), ofSize: 18)))

        return StringStyle(
            .color(Color.whiteFFFFFF.ui()),
            .font(.from(.nunito(.bold), ofSize: 10)),
            .xmlRules([
                .style("currency", currencyStyle),
                .style("price", priceStyle)
            ])
        )
    }

}
