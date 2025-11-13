import QtQuick
import qs.Widgets

Menu {
  MenuItem { text: "Balanced"; onTriggered: exec("asusctl profile -P Balanced") }
  MenuItem { text: "Performance"; onTriggered: exec("asusctl profile -P Performance") }
  MenuItem { text: "Quiet"; onTriggered: exec("asusctl profile -P Quiet") }
}
