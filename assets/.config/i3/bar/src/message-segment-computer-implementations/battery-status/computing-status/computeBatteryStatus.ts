import type {BatteryStatus} from "../status/BatteryStatus.ts";
import {computeBatteryStatusLevel} from "./computing-level/computeBatteryStatusLevel.ts";
import {statusCommandOutputToBatteryStatusChargingState} from "./status-command-output-to-battery-status-charging-state/statusCommandOutputToBatteryStatusChargingState.ts";
export function computeBatteryStatus(
	capacityCommandOutput: string,
	// TODO: Refactor type
	statusCommandOutput:
		| "Charging\n"
		| "Discharging\n"
		| "Full\n"
		| "Not charging\n",
): BatteryStatus {
	const level = computeBatteryStatusLevel(capacityCommandOutput);
	const chargingState =
		statusCommandOutputToBatteryStatusChargingState[statusCommandOutput];
	return {chargingState, level};
}
