import QtQuick
import qs.Common
import qs.Widgets
import qs.Modules.Plugins

PluginSettings {
  pluginId: "asusPowerPlugin"
  
  SliderSetting {
    settingKey: "refreshInterval"
    label: "Refresh Interval (seconds)"
    defaultValue: 5
    minimum: 1
    maximum: 60
    unit: "s"
    leftIcon: "schedule"
  }
}
