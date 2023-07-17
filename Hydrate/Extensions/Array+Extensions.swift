extension Array where Element: Equatable {
    func placeElementToFirstPosition(element: Element) -> [Element]? {
        var newArray: [Element] = []

        if let localElement = self.first(where: { $0 == element }) {
            newArray.append(localElement)
            self.forEach { item in
                if item != element {
                    newArray.append(item)
                }
            }
            return newArray
        }
        return nil
    }
}
