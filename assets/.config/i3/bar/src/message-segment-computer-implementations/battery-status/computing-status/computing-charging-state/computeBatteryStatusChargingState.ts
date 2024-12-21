import type { BatteryStatusChargingState } from "../../status/charging-state/BatteryStatusChargingState.ts";

export function computeBatteryStatusChargingState(
	statusCommandOutput: string,
): BatteryStatusChargingState {
	switch (statusCommandOutput) {
		case "Charging\n": {
			return "charging";
		}
		case "Discharging\n": {
			return "discharging";
		}
		default: {
			return "unknown";
		}
	}
}
