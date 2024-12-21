import type {BatteryStatusChargingState} from "../../status/charging-state/BatteryStatusChargingState.ts";
export const statusCommandOutputToBatteryStatusChargingState = {
	"Charging\n": "charging",
	"Discharging\n": "discharging",
	"Full\n": "notCharging",
	"Not charging\n": "notCharging",
} as const satisfies Record<string, BatteryStatusChargingState>;
