import { AsynchronousMessageSegmentComputer } from "../../core/message-segment-computer/types/asynchronous/AsynchronousMessageSegmentComputer.ts";

export class VolumeMessageSegmentComputer
	extends AsynchronousMessageSegmentComputer {
	public override async compute(): Promise<string> {
		const command = new Deno.Command("wpctl", {
			args: ["get-volume", "@DEFAULT_AUDIO_SINK@"],
			stdout: "piped",
		});

		const { stdout } = await command.output();
		const decoder = new TextDecoder();
		const commandOutput = decoder.decode(stdout);

		const commandOutputMatch = commandOutput.match(
			/^Volume: (?<volume>\d+\.\d+)\n$/,
		) as
			& RegExpMatchArray
			& Readonly<{ groups: Readonly<{ volume: string }> }>;

		const { volume: volumeAsString } = commandOutputMatch.groups;
		const volume = Number(volumeAsString);
		const formattedVolume = this.formatVolume(volume);
		return formattedVolume;
	}

	private formatVolume(volume: number): string {
		const numberInFormattedVolume = (volume * 100).toFixed(0).padStart(
			3,
			"0",
		);

		return `${numberInFormattedVolume}%`;
	}

	public override readonly intervalSeconds = 0.5;
}
