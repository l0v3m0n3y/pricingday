# pricingday
web-api for pricing.day Война, развязанная Путиным против Украины, бьет и по России. На этом сайте можно увидеть, как растут цены на самые популярные товары, и убедиться, что агрессивная политика российского руководства влияет на каждого человека в стране.
# main
```swift
import Foundation
let client = Pricingday()

do {
    let catalog = try await client.get_catalog()
    print(catalog)
} catch {
    print("Error: \(error)")
}

```

# Launch (your script)
```
swiftc -o pricingday pricingday.swift main.swift
./pricingday
```
