// swiftlint:disable function_body_length
// swiftlint:disable type_body_length

import SwiftUI

struct HelloPath: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.4074 * width, y: 0.66666 * height))
        path.addCurve(
            to: CGPoint(x: 0.37912 * width, y: 0.64036 * height),
            control1: CGPoint(x: 0.394 * width, y: 0.66541 * height),
            control2: CGPoint(x: 0.38561 * width, y: 0.655 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.35936 * width, y: 0.65516 * height),
            control1: CGPoint(x: 0.3724 * width, y: 0.64542 * height),
            control2: CGPoint(x: 0.36596 * width, y: 0.65049 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.33515 * width, y: 0.66661 * height),
            control1: CGPoint(x: 0.35172 * width, y: 0.66058 * height),
            control2: CGPoint(x: 0.34404 * width, y: 0.66621 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.31136 * width, y: 0.64014 * height),
            control1: CGPoint(x: 0.32194 * width, y: 0.66721 * height),
            control2: CGPoint(x: 0.31361 * width, y: 0.65789 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.31266 * width, y: 0.59788 * height),
            control1: CGPoint(x: 0.30956 * width, y: 0.62594 * height),
            control2: CGPoint(x: 0.31135 * width, y: 0.61194 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.32055 * width, y: 0.52577 * height),
            control1: CGPoint(x: 0.3149 * width, y: 0.57376 * height),
            control2: CGPoint(x: 0.3202 * width, y: 0.55027 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.31947 * width, y: 0.50864 * height),
            control1: CGPoint(x: 0.32063 * width, y: 0.51998 * height),
            control2: CGPoint(x: 0.32044 * width, y: 0.51422 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.3081 * width, y: 0.50025 * height),
            control1: CGPoint(x: 0.31799 * width, y: 0.50019 * height),
            control2: CGPoint(x: 0.31414 * width, y: 0.49746 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.29228 * width, y: 0.51435 * height),
            control1: CGPoint(x: 0.30196 * width, y: 0.50309 * height),
            control2: CGPoint(x: 0.29704 * width, y: 0.50865 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.27006 * width, y: 0.556 * height),
            control1: CGPoint(x: 0.28259 * width, y: 0.52593 * height),
            control2: CGPoint(x: 0.27552 * width, y: 0.5402 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.24817 * width, y: 0.65265 * height),
            control1: CGPoint(x: 0.25942 * width, y: 0.58681 * height),
            control2: CGPoint(x: 0.25126 * width, y: 0.61865 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.24592 * width, y: 0.66274 * height),
            control1: CGPoint(x: 0.24785 * width, y: 0.6561 * height),
            control2: CGPoint(x: 0.24704 * width, y: 0.65962 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.23806 * width, y: 0.66854 * height),
            control1: CGPoint(x: 0.2444 * width, y: 0.66697 * height),
            control2: CGPoint(x: 0.24187 * width, y: 0.67 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.23331 * width, y: 0.65761 * height),
            control1: CGPoint(x: 0.2341 * width, y: 0.66702 * height),
            control2: CGPoint(x: 0.23286 * width, y: 0.6627 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.2365 * width, y: 0.62541 * height),
            control1: CGPoint(x: 0.23426 * width, y: 0.64686 * height),
            control2: CGPoint(x: 0.23531 * width, y: 0.63612 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.24294 * width, y: 0.5544 * height),
            control1: CGPoint(x: 0.23913 * width, y: 0.60182 * height),
            control2: CGPoint(x: 0.24148 * width, y: 0.57819 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.2462 * width, y: 0.50925 * height),
            control1: CGPoint(x: 0.24384 * width, y: 0.53966 * height),
            control2: CGPoint(x: 0.24505 * width, y: 0.52496 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.21564 * width, y: 0.53801 * height),
            control1: CGPoint(x: 0.23651 * width, y: 0.52057 * height),
            control2: CGPoint(x: 0.22645 * width, y: 0.53006 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.1666 * width, y: 0.56303 * height),
            control1: CGPoint(x: 0.20014 * width, y: 0.54941 * height),
            control2: CGPoint(x: 0.1844 * width, y: 0.56 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.16467 * width, y: 0.56345 * height),
            control1: CGPoint(x: 0.16595 * width, y: 0.56314 * height),
            control2: CGPoint(x: 0.16532 * width, y: 0.56336 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.15551 * width, y: 0.55612 * height),
            control1: CGPoint(x: 0.15996 * width, y: 0.56408 * height),
            control2: CGPoint(x: 0.15618 * width, y: 0.56104 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.16199 * width, y: 0.54503 * height),
            control1: CGPoint(x: 0.15496 * width, y: 0.55202 * height),
            control2: CGPoint(x: 0.15804 * width, y: 0.54658 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.16958 * width, y: 0.54265 * height),
            control1: CGPoint(x: 0.16448 * width, y: 0.54404 * height),
            control2: CGPoint(x: 0.16702 * width, y: 0.54325 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.21541 * width, y: 0.51571 * height),
            control1: CGPoint(x: 0.18645 * width, y: 0.53868 * height),
            control2: CGPoint(x: 0.20119 * width, y: 0.52801 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.24592 * width, y: 0.48585 * height),
            control1: CGPoint(x: 0.226 * width, y: 0.50656 * height),
            control2: CGPoint(x: 0.23603 * width, y: 0.49634 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.25099 * width, y: 0.47368 * height),
            control1: CGPoint(x: 0.24894 * width, y: 0.48264 * height),
            control2: CGPoint(x: 0.25036 * width, y: 0.47889 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.26255 * width, y: 0.38489 * height),
            control1: CGPoint(x: 0.25463 * width, y: 0.44403 * height),
            control2: CGPoint(x: 0.2581 * width, y: 0.41432 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.28183 * width, y: 0.32146 * height),
            control1: CGPoint(x: 0.26598 * width, y: 0.36224 * height),
            control2: CGPoint(x: 0.27192 * width, y: 0.34059 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.29965 * width, y: 0.30145 * height),
            control1: CGPoint(x: 0.28638 * width, y: 0.31266 * height),
            control2: CGPoint(x: 0.29204 * width, y: 0.30533 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.32112 * width, y: 0.31122 * height),
            control1: CGPoint(x: 0.30879 * width, y: 0.29679 * height),
            control2: CGPoint(x: 0.31572 * width, y: 0.3002 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.32496 * width, y: 0.34713 * height),
            control1: CGPoint(x: 0.32663 * width, y: 0.32245 * height),
            control2: CGPoint(x: 0.3264 * width, y: 0.33488 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.28882 * width, y: 0.45339 * height),
            control1: CGPoint(x: 0.32027 * width, y: 0.3871 * height),
            control2: CGPoint(x: 0.30607 * width, y: 0.42124 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.26575 * width, y: 0.48661 * height),
            control1: CGPoint(x: 0.28216 * width, y: 0.4658 * height),
            control2: CGPoint(x: 0.27442 * width, y: 0.4768 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.2616 * width, y: 0.49535 * height),
            control1: CGPoint(x: 0.2637 * width, y: 0.48894 * height),
            control2: CGPoint(x: 0.26208 * width, y: 0.49164 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.25423 * width, y: 0.56437 * height),
            control1: CGPoint(x: 0.25869 * width, y: 0.51768 * height),
            control2: CGPoint(x: 0.25565 * width, y: 0.53998 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.26536 * width, y: 0.53304 * height),
            control1: CGPoint(x: 0.25829 * width, y: 0.55287 * height),
            control2: CGPoint(x: 0.26158 * width, y: 0.54278 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.29759 * width, y: 0.48607 * height),
            control1: CGPoint(x: 0.27296 * width, y: 0.51346 * height),
            control2: CGPoint(x: 0.28354 * width, y: 0.49736 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.33354 * width, y: 0.51154 * height),
            control1: CGPoint(x: 0.31657 * width, y: 0.47082 * height),
            control2: CGPoint(x: 0.33136 * width, y: 0.48756 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.32897 * width, y: 0.57528 * height),
            control1: CGPoint(x: 0.33552 * width, y: 0.53344 * height),
            control2: CGPoint(x: 0.33138 * width, y: 0.55417 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.32355 * width, y: 0.62711 * height),
            control1: CGPoint(x: 0.327 * width, y: 0.59253 * height),
            control2: CGPoint(x: 0.32348 * width, y: 0.60948 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.32441 * width, y: 0.63629 * height),
            control1: CGPoint(x: 0.32356 * width, y: 0.63017 * height),
            control2: CGPoint(x: 0.32387 * width, y: 0.63331 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.33579 * width, y: 0.64725 * height),
            control1: CGPoint(x: 0.32596 * width, y: 0.6448 * height),
            control2: CGPoint(x: 0.32934 * width, y: 0.64799 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.34963 * width, y: 0.64114 * height),
            control1: CGPoint(x: 0.34074 * width, y: 0.64668 * height),
            control2: CGPoint(x: 0.34537 * width, y: 0.6444 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.37143 * width, y: 0.62346 * height),
            control1: CGPoint(x: 0.35699 * width, y: 0.63549 * height),
            control2: CGPoint(x: 0.36414 * width, y: 0.6293 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.37462 * width, y: 0.61402 * height),
            control1: CGPoint(x: 0.37419 * width, y: 0.62125 * height),
            control2: CGPoint(x: 0.37478 * width, y: 0.61827 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.40924 * width, y: 0.48548 * height),
            control1: CGPoint(x: 0.37281 * width, y: 0.56454 * height),
            control2: CGPoint(x: 0.38295 * width, y: 0.52092 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.4228 * width, y: 0.4739 * height),
            control1: CGPoint(x: 0.41308 * width, y: 0.48031 * height),
            control2: CGPoint(x: 0.41767 * width, y: 0.47646 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.45243 * width, y: 0.49551 * height),
            control1: CGPoint(x: 0.43637 * width, y: 0.46712 * height),
            control2: CGPoint(x: 0.4493 * width, y: 0.47633 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.44599 * width, y: 0.54752 * height),
            control1: CGPoint(x: 0.45543 * width, y: 0.51391 * height),
            control2: CGPoint(x: 0.45203 * width, y: 0.53116 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.40983 * width, y: 0.60704 * height),
            control1: CGPoint(x: 0.43731 * width, y: 0.5711 * height),
            control2: CGPoint(x: 0.42441 * width, y: 0.59005 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.3937 * width, y: 0.6253 * height),
            control1: CGPoint(x: 0.40452 * width, y: 0.61323 * height),
            control2: CGPoint(x: 0.39925 * width, y: 0.61952 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.39279 * width, y: 0.63414 * height),
            control1: CGPoint(x: 0.3909 * width, y: 0.62821 * height),
            control2: CGPoint(x: 0.39107 * width, y: 0.63067 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.41421 * width, y: 0.64692 * height),
            control1: CGPoint(x: 0.39796 * width, y: 0.6446 * height),
            control2: CGPoint(x: 0.40505 * width, y: 0.64879 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.45107 * width, y: 0.62244 * height),
            control1: CGPoint(x: 0.4284 * width, y: 0.64402 * height),
            control2: CGPoint(x: 0.44012 * width, y: 0.63416 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.47606 * width, y: 0.58889 * height),
            control1: CGPoint(x: 0.4603 * width, y: 0.61256 * height),
            control2: CGPoint(x: 0.46833 * width, y: 0.60095 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.47962 * width, y: 0.57153 * height),
            control1: CGPoint(x: 0.47945 * width, y: 0.5836 * height),
            control2: CGPoint(x: 0.47936 * width, y: 0.57765 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.48697 * width, y: 0.49732 * height),
            control1: CGPoint(x: 0.48066 * width, y: 0.54653 * height),
            control2: CGPoint(x: 0.48448 * width, y: 0.52205 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.51085 * width, y: 0.38195 * height),
            control1: CGPoint(x: 0.49099 * width, y: 0.45733 * height),
            control2: CGPoint(x: 0.50013 * width, y: 0.41929 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.53938 * width, y: 0.31725 * height),
            control1: CGPoint(x: 0.51763 * width, y: 0.35832 * height),
            control2: CGPoint(x: 0.52733 * width, y: 0.33674 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.55143 * width, y: 0.30288 * height),
            control1: CGPoint(x: 0.54285 * width, y: 0.31164 * height),
            control2: CGPoint(x: 0.54664 * width, y: 0.30646 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.57548 * width, y: 0.31595 * height),
            control1: CGPoint(x: 0.56173 * width, y: 0.29521 * height),
            control2: CGPoint(x: 0.57199 * width, y: 0.30068 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.57492 * width, y: 0.36258 * height),
            control1: CGPoint(x: 0.57904 * width, y: 0.33152 * height),
            control2: CGPoint(x: 0.57746 * width, y: 0.34719 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.54277 * width, y: 0.48066 * height),
            control1: CGPoint(x: 0.56811 * width, y: 0.40389 * height),
            control2: CGPoint(x: 0.55576 * width, y: 0.44238 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.49777 * width, y: 0.57989 * height),
            control1: CGPoint(x: 0.53068 * width, y: 0.51629 * height),
            control2: CGPoint(x: 0.51586 * width, y: 0.54943 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.49332 * width, y: 0.60244 * height),
            control1: CGPoint(x: 0.49369 * width, y: 0.58677 * height),
            control2: CGPoint(x: 0.49207 * width, y: 0.59358 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.49959 * width, y: 0.63152 * height),
            control1: CGPoint(x: 0.49474 * width, y: 0.61246 * height),
            control2: CGPoint(x: 0.49572 * width, y: 0.62252 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.52429 * width, y: 0.64657 * height),
            control1: CGPoint(x: 0.50529 * width, y: 0.6448 * height),
            control2: CGPoint(x: 0.51323 * width, y: 0.64977 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.56195 * width, y: 0.6171 * height),
            control1: CGPoint(x: 0.53914 * width, y: 0.64228 * height),
            control2: CGPoint(x: 0.55085 * width, y: 0.63027 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.57696 * width, y: 0.57333 * height),
            control1: CGPoint(x: 0.57591 * width, y: 0.60053 * height),
            control2: CGPoint(x: 0.57542 * width, y: 0.60036 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.59163 * width, y: 0.4558 * height),
            control1: CGPoint(x: 0.57923 * width, y: 0.53359 * height),
            control2: CGPoint(x: 0.58366 * width, y: 0.49434 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.61889 * width, y: 0.35506 * height),
            control1: CGPoint(x: 0.59878 * width, y: 0.42119 * height),
            control2: CGPoint(x: 0.60644 * width, y: 0.38698 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.64191 * width, y: 0.31237 * height),
            control1: CGPoint(x: 0.62505 * width, y: 0.33927 * height),
            control2: CGPoint(x: 0.63281 * width, y: 0.32516 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.65316 * width, y: 0.30202 * height),
            control1: CGPoint(x: 0.64511 * width, y: 0.30788 * height),
            control2: CGPoint(x: 0.64882 * width, y: 0.30428 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.67487 * width, y: 0.31341 * height),
            control1: CGPoint(x: 0.66235 * width, y: 0.29724 * height),
            control2: CGPoint(x: 0.67035 * width, y: 0.30147 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.67753 * width, y: 0.34989 * height),
            control1: CGPoint(x: 0.6793 * width, y: 0.3251 * height),
            control2: CGPoint(x: 0.67849 * width, y: 0.33762 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.64334 * width, y: 0.48904 * height),
            control1: CGPoint(x: 0.67361 * width, y: 0.39963 * height),
            control2: CGPoint(x: 0.6583 * width, y: 0.4443 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.59177 * width, y: 0.60149 * height),
            control1: CGPoint(x: 0.62979 * width, y: 0.52958 * height),
            control2: CGPoint(x: 0.61229 * width, y: 0.56685 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.5901 * width, y: 0.61239 * height),
            control1: CGPoint(x: 0.58972 * width, y: 0.60495 * height),
            control2: CGPoint(x: 0.58926 * width, y: 0.6081 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.59766 * width, y: 0.63744 * height),
            control1: CGPoint(x: 0.59183 * width, y: 0.62122 * height),
            control2: CGPoint(x: 0.5939 * width, y: 0.62978 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.61448 * width, y: 0.64686 * height),
            control1: CGPoint(x: 0.60178 * width, y: 0.64583 * height),
            control2: CGPoint(x: 0.60712 * width, y: 0.64881 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.63136 * width, y: 0.63547 * height),
            control1: CGPoint(x: 0.62086 * width, y: 0.64516 * height),
            control2: CGPoint(x: 0.62641 * width, y: 0.64109 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.66268 * width, y: 0.58998 * height),
            control1: CGPoint(x: 0.64317 * width, y: 0.62207 * height),
            control2: CGPoint(x: 0.65298 * width, y: 0.60609 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.67044 * width, y: 0.5638 * height),
            control1: CGPoint(x: 0.66725 * width, y: 0.5824 * height),
            control2: CGPoint(x: 0.66949 * width, y: 0.57334 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.6786 * width, y: 0.53201 * height),
            control1: CGPoint(x: 0.67157 * width, y: 0.55239 * height),
            control2: CGPoint(x: 0.67471 * width, y: 0.54204 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.70393 * width, y: 0.48683 * height),
            control1: CGPoint(x: 0.68518 * width, y: 0.51501 * height),
            control2: CGPoint(x: 0.69323 * width, y: 0.49916 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.73947 * width, y: 0.47454 * height),
            control1: CGPoint(x: 0.7139 * width, y: 0.47534 * height),
            control2: CGPoint(x: 0.72565 * width, y: 0.46776 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.75294 * width, y: 0.48834 * height),
            control1: CGPoint(x: 0.74495 * width, y: 0.47723 * height),
            control2: CGPoint(x: 0.74944 * width, y: 0.48203 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.76573 * width, y: 0.54034 * height),
            control1: CGPoint(x: 0.76146 * width, y: 0.50371 * height),
            control2: CGPoint(x: 0.7654 * width, y: 0.52122 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.76588 * width, y: 0.54699 * height),
            control1: CGPoint(x: 0.76576 * width, y: 0.54256 * height),
            control2: CGPoint(x: 0.76578 * width, y: 0.54477 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.76647 * width, y: 0.54956 * height),
            control1: CGPoint(x: 0.7659 * width, y: 0.54761 * height),
            control2: CGPoint(x: 0.76615 * width, y: 0.54822 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.79373 * width, y: 0.53372 * height),
            control1: CGPoint(x: 0.77673 * width, y: 0.54796 * height),
            control2: CGPoint(x: 0.78567 * width, y: 0.54216 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.80923 * width, y: 0.51174 * height),
            control1: CGPoint(x: 0.79968 * width, y: 0.52748 * height),
            control2: CGPoint(x: 0.8048 * width, y: 0.52004 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.81911 * width, y: 0.50778 * height),
            control1: CGPoint(x: 0.8123 * width, y: 0.506 * height),
            control2: CGPoint(x: 0.8159 * width, y: 0.50464 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.82007 * width, y: 0.52213 * height),
            control1: CGPoint(x: 0.8221 * width, y: 0.51071 * height),
            control2: CGPoint(x: 0.82285 * width, y: 0.51704 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.7689 * width, y: 0.56793 * height),
            control1: CGPoint(x: 0.80712 * width, y: 0.54582 * height),
            control2: CGPoint(x: 0.79106 * width, y: 0.56349 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.76283 * width, y: 0.57609 * height),
            control1: CGPoint(x: 0.76472 * width, y: 0.56877 * height),
            control2: CGPoint(x: 0.76365 * width, y: 0.57116 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.74004 * width, y: 0.64437 * height),
            control1: CGPoint(x: 0.75867 * width, y: 0.60094 * height),
            control2: CGPoint(x: 0.75225 * width, y: 0.62443 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.69685 * width, y: 0.66474 * height),
            control1: CGPoint(x: 0.72943 * width, y: 0.6617 * height),
            control2: CGPoint(x: 0.71039 * width, y: 0.6717 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.6698 * width, y: 0.62127 * height),
            control1: CGPoint(x: 0.68229 * width, y: 0.65726 * height),
            control2: CGPoint(x: 0.67424 * width, y: 0.64099 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.66762 * width, y: 0.60624 * height),
            control1: CGPoint(x: 0.66876 * width, y: 0.61665 * height),
            control2: CGPoint(x: 0.6684 * width, y: 0.61176 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.64846 * width, y: 0.63939 * height),
            control1: CGPoint(x: 0.66223 * width, y: 0.61867 * height),
            control2: CGPoint(x: 0.65628 * width, y: 0.63012 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.61785 * width, y: 0.66556 * height),
            control1: CGPoint(x: 0.63929 * width, y: 0.65027 * height),
            control2: CGPoint(x: 0.63042 * width, y: 0.6618 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.58769 * width, y: 0.64974 * height),
            control1: CGPoint(x: 0.6051 * width, y: 0.66937 * height),
            control2: CGPoint(x: 0.59515 * width, y: 0.66422 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.57811 * width, y: 0.62287 * height),
            control1: CGPoint(x: 0.58358 * width, y: 0.64174 * height),
            control2: CGPoint(x: 0.58073 * width, y: 0.63285 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.5685 * width, y: 0.63399 * height),
            control1: CGPoint(x: 0.57458 * width, y: 0.62695 * height),
            control2: CGPoint(x: 0.57149 * width, y: 0.63039 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.53418 * width, y: 0.66268 * height),
            control1: CGPoint(x: 0.55829 * width, y: 0.64629 * height),
            control2: CGPoint(x: 0.54702 * width, y: 0.65628 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.48426 * width, y: 0.62934 * height),
            control1: CGPoint(x: 0.51096 * width, y: 0.67425 * height),
            control2: CGPoint(x: 0.49181 * width, y: 0.66143 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.48027 * width, y: 0.60937 * height),
            control1: CGPoint(x: 0.48284 * width, y: 0.62331 * height),
            control2: CGPoint(x: 0.4818 * width, y: 0.6171 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.46605 * width, y: 0.62971 * height),
            control1: CGPoint(x: 0.47521 * width, y: 0.61664 * height),
            control2: CGPoint(x: 0.47078 * width, y: 0.62338 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.42797 * width, y: 0.66243 * height),
            control1: CGPoint(x: 0.45512 * width, y: 0.64435 * height),
            control2: CGPoint(x: 0.44238 * width, y: 0.65524 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.4074 * width, y: 0.66666 * height),
            control1: CGPoint(x: 0.42149 * width, y: 0.66566 * height),
            control2: CGPoint(x: 0.41476 * width, y: 0.66698 * height)
        )
        path.move(to: CGPoint(x: 0.65584 * width, y: 0.40173 * height))
        path.addCurve(
            to: CGPoint(x: 0.66337 * width, y: 0.36059 * height),
            control1: CGPoint(x: 0.65888 * width, y: 0.3882 * height),
            control2: CGPoint(x: 0.66181 * width, y: 0.37462 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.66375 * width, y: 0.32569 * height),
            control1: CGPoint(x: 0.66465 * width, y: 0.34899 * height),
            control2: CGPoint(x: 0.66571 * width, y: 0.33736 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.65597 * width, y: 0.32105 * height),
            control1: CGPoint(x: 0.66252 * width, y: 0.31838 * height),
            control2: CGPoint(x: 0.66076 * width, y: 0.31726 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.64364 * width, y: 0.33692 * height),
            control1: CGPoint(x: 0.65096 * width, y: 0.32501 * height),
            control2: CGPoint(x: 0.64713 * width, y: 0.33079 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.61272 * width, y: 0.42148 * height),
            control1: CGPoint(x: 0.62918 * width, y: 0.36227 * height),
            control2: CGPoint(x: 0.62017 * width, y: 0.3914 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.59025 * width, y: 0.56721 * height),
            control1: CGPoint(x: 0.601 * width, y: 0.46882 * height),
            control2: CGPoint(x: 0.59483 * width, y: 0.51781 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.59105 * width, y: 0.57497 * height),
            control1: CGPoint(x: 0.59004 * width, y: 0.56941 * height),
            control2: CGPoint(x: 0.58977 * width, y: 0.5718 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.65584 * width, y: 0.40173 * height),
            control1: CGPoint(x: 0.61914 * width, y: 0.52141 * height),
            control2: CGPoint(x: 0.63957 * width, y: 0.46361 * height)
        )
        path.move(to: CGPoint(x: 0.68093 * width, y: 0.60402 * height))
        path.addCurve(
            to: CGPoint(x: 0.6818 * width, y: 0.61322 * height),
            control1: CGPoint(x: 0.68122 * width, y: 0.60709 * height),
            control2: CGPoint(x: 0.6815 * width, y: 0.61016 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.72448 * width, y: 0.63853 * height),
            control1: CGPoint(x: 0.68473 * width, y: 0.64372 * height),
            control2: CGPoint(x: 0.7065 * width, y: 0.65692 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.75072 * width, y: 0.56946 * height),
            control1: CGPoint(x: 0.74097 * width, y: 0.62167 * height),
            control2: CGPoint(x: 0.74551 * width, y: 0.596 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.70972 * width, y: 0.50612 * height),
            control1: CGPoint(x: 0.72315 * width, y: 0.565 * height),
            control2: CGPoint(x: 0.71288 * width, y: 0.53987 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.68093 * width, y: 0.60402 * height),
            control1: CGPoint(x: 0.6927 * width, y: 0.52808 * height),
            control2: CGPoint(x: 0.68021 * width, y: 0.56083 * height)
        )
        path.move(to: CGPoint(x: 0.55127 * width, y: 0.40833 * height))
        path.addCurve(
            to: CGPoint(x: 0.56178 * width, y: 0.35926 * height),
            control1: CGPoint(x: 0.55526 * width, y: 0.39217 * height),
            control2: CGPoint(x: 0.55881 * width, y: 0.37583 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.56321 * width, y: 0.32622 * height),
            control1: CGPoint(x: 0.56373 * width, y: 0.34836 * height),
            control2: CGPoint(x: 0.5637 * width, y: 0.33728 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.556 * width, y: 0.32126 * height),
            control1: CGPoint(x: 0.56287 * width, y: 0.31858 * height),
            control2: CGPoint(x: 0.56066 * width, y: 0.31726 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.54782 * width, y: 0.33164 * height),
            control1: CGPoint(x: 0.55279 * width, y: 0.32402 * height),
            control2: CGPoint(x: 0.55025 * width, y: 0.32773 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.519 * width, y: 0.40285 * height),
            control1: CGPoint(x: 0.53471 * width, y: 0.35275 * height),
            control2: CGPoint(x: 0.5259 * width, y: 0.37711 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.49737 * width, y: 0.52187 * height),
            control1: CGPoint(x: 0.50864 * width, y: 0.44144 * height),
            control2: CGPoint(x: 0.50211 * width, y: 0.48136 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.49547 * width, y: 0.53892 * height),
            control1: CGPoint(x: 0.49671 * width, y: 0.52754 * height),
            control2: CGPoint(x: 0.49595 * width, y: 0.53321 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.49451 * width, y: 0.55663 * height),
            control1: CGPoint(x: 0.49501 * width, y: 0.54433 * height),
            control2: CGPoint(x: 0.49389 * width, y: 0.54971 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.55127 * width, y: 0.40833 * height),
            control1: CGPoint(x: 0.51904 * width, y: 0.51059 * height),
            control2: CGPoint(x: 0.53616 * width, y: 0.46076 * height)
        )
        path.move(to: CGPoint(x: 0.39634 * width, y: 0.59886 * height))
        path.addCurve(
            to: CGPoint(x: 0.41117 * width, y: 0.58065 * height),
            control1: CGPoint(x: 0.4013 * width, y: 0.59281 * height),
            control2: CGPoint(x: 0.40645 * width, y: 0.58702 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.43475 * width, y: 0.53797 * height),
            control1: CGPoint(x: 0.42055 * width, y: 0.56802 * height),
            control2: CGPoint(x: 0.42944 * width, y: 0.55483 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.44016 * width, y: 0.50272 * height),
            control1: CGPoint(x: 0.4383 * width, y: 0.5267 * height),
            control2: CGPoint(x: 0.44131 * width, y: 0.51531 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.42654 * width, y: 0.49167 * height),
            control1: CGPoint(x: 0.43921 * width, y: 0.49237 * height),
            control2: CGPoint(x: 0.43363 * width, y: 0.48783 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.41849 * width, y: 0.499 * height),
            control1: CGPoint(x: 0.42349 * width, y: 0.49333 * height),
            control2: CGPoint(x: 0.42081 * width, y: 0.4958 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.38716 * width, y: 0.60037 * height),
            control1: CGPoint(x: 0.39812 * width, y: 0.5271 * height),
            control2: CGPoint(x: 0.38814 * width, y: 0.56116 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.38872 * width, y: 0.60628 * height),
            control1: CGPoint(x: 0.38711 * width, y: 0.6025 * height),
            control2: CGPoint(x: 0.38701 * width, y: 0.60483 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.39634 * width, y: 0.59886 * height),
            control1: CGPoint(x: 0.39176 * width, y: 0.60525 * height),
            control2: CGPoint(x: 0.39328 * width, y: 0.6014 * height)
        )
        path.move(to: CGPoint(x: 0.30374 * width, y: 0.38371 * height))
        path.addCurve(
            to: CGPoint(x: 0.30575 * width, y: 0.37694 * height),
            control1: CGPoint(x: 0.30442 * width, y: 0.38145 * height),
            control2: CGPoint(x: 0.30511 * width, y: 0.37921 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.31226 * width, y: 0.33042 * height),
            control1: CGPoint(x: 0.30999 * width, y: 0.36197 * height),
            control2: CGPoint(x: 0.31316 * width, y: 0.34674 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.30815 * width, y: 0.31914 * height),
            control1: CGPoint(x: 0.312 * width, y: 0.32582 * height),
            control2: CGPoint(x: 0.31142 * width, y: 0.32119 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.30026 * width, y: 0.3228 * height),
            control1: CGPoint(x: 0.30508 * width, y: 0.31721 * height),
            control2: CGPoint(x: 0.30249 * width, y: 0.32048 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.28534 * width, y: 0.35022 * height),
            control1: CGPoint(x: 0.29339 * width, y: 0.32996 * height),
            control2: CGPoint(x: 0.28855 * width, y: 0.33935 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.26651 * width, y: 0.45958 * height),
            control1: CGPoint(x: 0.27501 * width, y: 0.38534 * height),
            control2: CGPoint(x: 0.27028 * width, y: 0.42226 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.30374 * width, y: 0.38371 * height),
            control1: CGPoint(x: 0.28213 * width, y: 0.4375 * height),
            control2: CGPoint(x: 0.29464 * width, y: 0.41276 * height)
        )
        path.move(to: CGPoint(x: 0.7231 * width, y: 0.5118 * height))
        path.addCurve(
            to: CGPoint(x: 0.74739 * width, y: 0.54949 * height),
            control1: CGPoint(x: 0.72597 * width, y: 0.53061 * height),
            control2: CGPoint(x: 0.73342 * width, y: 0.54391 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.75283 * width, y: 0.54413 * height),
            control1: CGPoint(x: 0.75107 * width, y: 0.55095 * height),
            control2: CGPoint(x: 0.75287 * width, y: 0.54993 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.74502 * width, y: 0.5043 * height),
            control1: CGPoint(x: 0.75273 * width, y: 0.5299 * height),
            control2: CGPoint(x: 0.75046 * width, y: 0.51655 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.73393 * width, y: 0.49191 * height),
            control1: CGPoint(x: 0.74238 * width, y: 0.49837 * height),
            control2: CGPoint(x: 0.73859 * width, y: 0.49437 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.72306 * width, y: 0.50072 * height),
            control1: CGPoint(x: 0.72765 * width, y: 0.48859 * height),
            control2: CGPoint(x: 0.72377 * width, y: 0.49172 * height)
        )
        path.addCurve(
            to: CGPoint(x: 0.7231 * width, y: 0.5118 * height),
            control1: CGPoint(x: 0.7228 * width, y: 0.504 * height),
            control2: CGPoint(x: 0.723 * width, y: 0.50734 * height)
        )
        path.closeSubpath()
        return path
    }
}

// swiftlint:enable function_body_length type_body_length
