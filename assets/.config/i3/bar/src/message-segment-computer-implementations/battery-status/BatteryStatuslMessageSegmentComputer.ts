import type {MessageSegmentComputer} from "../../core/message-segment-computer/MessageSegmentComputer.ts";
import {computeBatteryStatus} from "./computing-status/computeBatteryStatus.ts";
import {formatBatteryStatus} from "./formatting/formatBatteryStatus.ts";
export class BatteryStatusMessageSegmentComputer
	implements MessageSegmentComputer
{
	public async compute(): Promise<string> {
		const [capacityCommandOutput, statusCommandOutput] = await Promise.all([
			Deno.readTextFile("/sys/class/power_supply/BAT1/capacity"),
			Deno.readTextFile("/sys/class/power_supply/BAT1/status"),
		]);
		const status = computeBatteryStatus(
			capacityCommandOutput,
			statusCommandOutput,
		);
		return formatBatteryStatus(status);
	}
}
