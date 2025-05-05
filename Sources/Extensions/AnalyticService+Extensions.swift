//
//  AnalyticService+Extensions.swift
//  TomoCodes
//
//  Created by Tomasz Lizer on 05/05/2025.
//

import Ignite

extension Analytics.Service {
    static func goatCounter(_ code: String) -> Self {
        .custom(
            """
            <!-- GoatCounter Analytics -->
            <script data-goatcounter="https://\(code).goatcounter.com/count"
                    async src="//gc.zgo.at/count.js">
            </script>
            """
        )
    }
}
