{ config, pkgs, ... }:

{
   programs.waybar = {
		enable = true;
		systemd.enable = true;
		settings = {
			mainBar = {
				layer = "top";
				position = "bottom";
				height = 30;
				modules-left = [ "hyprland/workspaces" ];
				modules-center = [ "tray" ];
				modules-right = [ "network" "backlight" "pulseaudio" "temperature" "battery" "custom/power" "clock" ];

				"tray" = {
					icon-size = 20;
					spacing = 3;
				};

				"custom/power" = {
					format = "󰐥";
					on-click = "systemctl poweroff";
					on-click-right = "systemctl reboot";
				};

				"hyprland/workspaces" = {
					all-outputs = true;
				};

				"clock" = {
					format = "{:%H:%M 󰅐 %d.%m.%Y}";
				};

				"battery" = {
					interval = 20;
					format-discharging = "{icon} {capacity}%";
					format-charging = "󱐋{icon} {capacity}%";
					format-icons = ["󱊡" "󱊢" "󱊣"];
				};

				"backlight" = {
					format = "󰛨 {percent}%";
				};

				"pulseaudio" = {
					format = "󰕾 {volume}%";
					format-muted = "󰖁 {volume}%";
				};

				"temperature" = {
					critical-threshold = 85;
					format = "{icon} {temperatureC}°C";
					format-critical = " {temperatureC}°C";
					format-icons = ["" "" ""];
				};

				"network" = {
					format-ethernet = "󰈀";
					tooltip-format-ethernet = "󰈀\n󰩟 {ipaddr}\n󰕒 {bandwidthUpBytes}\n󰇚 {bandwidthDownBytes}";

					format-wifi = "{icon} {signalStrength}%";
					tooltip-format-wifi = "{icon} {essid} ({signalStrength}%)\n󰩟 {ipaddr}\n󰕒 {bandwidthUpBytes}\n󰇚 {bandwidthDownBytes}";
					format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
				};
			};
		};
		style = ''
			* {
				border: none;
				border-radius: 0;
				font-family: Roboto, Helvetica, Arial, sans-serif;
				font-size: 13px;
				min-height: 0;
			}

			window#waybar {
				background: rgba(43, 48, 59, 1);
				/* border-bottom: 3px solid rgba(100, 114, 125, 0.5); */
				color: white;
			}

			#workspaces button {
				margin: 3px 0;
				color: white;
				background: transparent;
			}

			#workspaces button.active {
				margin: 3px 0;
				border-radius: 5;
				background: rgba(100, 114, 125, 0.5);
			}

			#clock, #battery, #pulseaudio, #backlight, #temperature, #network, #custom-power {
				padding: 0 10px;
				margin: 3px;
				background: rgba(100, 114, 125, 0.5);
				border-radius: 5;

			}

			#temperature.critical {
				background: rgba(255, 41, 99, 0.79);
			}
		'';
	};
}