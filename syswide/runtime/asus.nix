{
  config,
  lib,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [pciutils];
  services.supergfxd.enable = true;
  systemd.services.supergfxd.path = [pkgs.pciutils];
  services.asusd = {
    enable = true;
    enableUserService = true;
    fanCurvesConfig.text = ''
      (
          profiles: (
              balanced: [
                  (
                      fan: CPU,
                      pwm: (51, 64, 77, 89, 102, 140, 191, 255),
                      temp: (30, 35, 40, 45, 50, 60, 70, 80),
                      enabled: true,
                  ),
                  (
                      fan: GPU,
                      pwm: (64, 77, 89, 102, 115, 153, 204, 255),
                      temp: (30, 35, 40, 45, 50, 60, 70, 80),
                      enabled: true,
                  ),
              ],
              performance: [
                  (
                      fan: CPU,
                      pwm: (89, 102, 115, 140, 166, 204, 242, 255),
                      temp: (30, 35, 40, 50, 60, 70, 80, 90),
                      enabled: true,
                  ),
                  (
                      fan: GPU,
                      pwm: (102, 115, 128, 153, 179, 217, 255, 255),
                      temp: (30, 35, 40, 50, 60, 70, 80, 90),
                      enabled: true,
                  ),
              ],
              quiet: [
                  (
                      fan: CPU,
                      pwm: (0, 0, 51, 77, 115, 153, 204, 255),
                      temp: (30, 35, 40, 50, 60, 70, 80, 90),
                      enabled: true,
                  ),
                  (
                      fan: GPU,
                      pwm: (0, 0, 64, 89, 128, 166, 217, 255),
                      temp: (30, 35, 40, 50, 60, 70, 80, 90),
                      enabled: true,
                  ),
              ],
              custom: [],
          ),
      )
    '';
    auraConfigs."tuf".text = ''
      (
          config_name: "aura_tuf.ron",
          brightness: Med,
          current_mode: Static,
          builtins: {
              Static: (
                  mode: Static,
                  zone: r#None,
                  colour1: (
                      r: 122,
                      g: 162,
                      b: 247,
                  ),
                  colour2: (
                      r: 0,
                      g: 0,
                      b: 0,
                  ),
                  speed: Med,
                  direction: Right,
              ),
              Breathe: (
                  mode: Breathe,
                  zone: r#None,
                  colour1: (
                      r: 166,
                      g: 0,
                      b: 0,
                  ),
                  colour2: (
                      r: 0,
                      g: 0,
                      b: 0,
                  ),
                  speed: Med,
                  direction: Right,
              ),
              RainbowCycle: (
                  mode: RainbowCycle,
                  zone: r#None,
                  colour1: (
                      r: 166,
                      g: 0,
                      b: 0,
                  ),
                  colour2: (
                      r: 0,
                      g: 0,
                      b: 0,
                  ),
                  speed: Med,
                  direction: Right,
              ),
              RainbowWave: (
                  mode: RainbowWave,
                  zone: r#None,
                  colour1: (
                      r: 166,
                      g: 0,
                      b: 0,
                  ),
                  colour2: (
                      r: 0,
                      g: 0,
                      b: 0,
                  ),
                  speed: Med,
                  direction: Right,
              ),
              Pulse: (
                  mode: Pulse,
                  zone: r#None,
                  colour1: (
                      r: 166,
                      g: 0,
                      b: 0,
                  ),
                  colour2: (
                      r: 0,
                      g: 0,
                      b: 0,
                  ),
                  speed: Med,
                  direction: Right,
              ),
          },
          multizone_on: false,
          enabled: (
              states: [
                  (
                      zone: Keyboard,
                      boot: true,
                      awake: true,
                      sleep: true,
                      shutdown: true,
                  ),
              ],
          ),
      )
    '';
  };
}
