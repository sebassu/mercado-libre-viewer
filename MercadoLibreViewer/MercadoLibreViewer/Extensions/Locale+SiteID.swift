import Foundation

extension Locale {
    static var currentSiteId: String {
        get {
            let regionCode = self.current.regionCode
            switch regionCode {
            case "AR": return "MLA"
            case "BR": return "MLB"
            case "CL": return "MLC"
            case "DM": return "MRD"
            case "MX": return "MLM"
            case "VE": return "MLV"
            case "BO", "CO", "CR", "CU", "EC", "GT", "HN", "NI", "PA", "PE", "PY", "SV":
                return "M\(regionCode!)"
            default: return "MLU"
            }
        }
    }
}
