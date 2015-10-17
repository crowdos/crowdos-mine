var __cache = new Array()

function __lookup(page) {
  if (__cache[page] == undefined) {
    var comp = Qt.createComponent(page)
    if (!comp) {
      return null
    }

    if (comp.status == Component.Error) {
      console.log(comp.errorString())
      comp.destroy()
      return null
    }

    __cache[page] = comp
  }

  return __cache[page];
}
