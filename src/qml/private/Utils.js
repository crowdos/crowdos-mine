.pragma library

function findPage(item) {
    var page = item

    while (item != null) {
        if (item.__menu !== undefined) {
            return item
        }

        item = item.parent
    }

    return null
}
