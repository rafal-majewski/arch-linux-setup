import type {MessageSegmentComputer} from "../../core/message-segment-computer/MessageSegmentComputer.ts";
import {computeVolumeStatus} from "./computing-status/computeVolumeStatus.ts";
import {formatVolumeStatus} from "./formatting/formatVolumeStatus.ts";
export class VolumeStatusMessageSegmentComputer
	implements MessageSegmentComputer
{
	public async compute(): Promise<string> {
		const command = new Deno.Command("wpctl", {
			args: ["get-volume", "@DEFAULT_AUDIO_SINK@"],
			stdout: "piped",
		});
		const commandOutput = new TextDecoder().decode(
			(await command.output()).stdout,
		);
		const status = computeVolumeStatus(commandOutput);
		return formatVolumeStatus(status);
	}
}
