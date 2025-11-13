import QtQuick
import Quickshell
import Quickshell.Io
import qs.Common
import qs.Services
import qs.Widgets
import qs.Modules.Plugins

PluginComponent {
  id: root

  // === EXACTLY like Pomodoro: use ?? not || ===
  property int refreshInterval: (pluginData.refreshInterval ?? 5) * 1000
  property string currentProfile: "Loading..."

  // === Dynamic script path, no hardcoding ===
  property string scriptPath: {
    var url = Qt.resolvedUrl("get-profile");
    return url.toString().replace("file://", "");
  }

  // === Use qs.Services.popoutService EXACTLY like Pomodoro uses BatteryService ===
  pillClickAction: (x, y, w, s, scr) => qs.Services.popoutService.toggleAsusPowerMenu(x, y, w, s, scr)

  Process {
    id: proc
    command: ["bash", scriptPath]
    running: false
    
    stdout: SplitParser {
      onRead: data => root.currentProfile = data.trim()
    }
    
    onRunningChanged: {
      if (!running && exitCode !== 0) {
        root.currentProfile = "ERR";
        console.error("asusctl failed:", exitCode);
      }
    }
  }

  Timer {
    interval: refreshInterval
    running: true
    repeat: true
    triggeredOnStart: true
    onTriggered: proc.running = true
  }

  horizontalBarPill: Component {
    Row {
      spacing: Theme.spacingXS
      rightPadding: Theme.spacingS
      
      StyledText { text: "󰻾 "; font.pixelSize: Theme.fontSizeMedium; color: Theme.surfaceText }
      StyledText { text: root.currentProfile; font.pixelSize: Theme.fontSizeSmall; color: Theme.surfaceText }
    }
  }
}
