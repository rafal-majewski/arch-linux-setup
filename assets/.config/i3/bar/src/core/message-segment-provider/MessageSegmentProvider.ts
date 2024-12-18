import type {MessageSegmentComputer} from "../message-segment-computer/MessageSegmentComputer.ts";
import {wait} from "./waiting/wait.ts";
export class MessageSegmentProvider {
	private readonly computer: MessageSegmentComputer;
	private readonly intervalSeconds: number;
	public constructor(
		computer: MessageSegmentComputer,
		intervalSeconds: number,
	) {
		this.computer = computer;
		this.intervalSeconds = intervalSeconds;
	}
	public async *provide(): AsyncGenerator<string, never, void> {
		for (;;) {
			yield await this.computer.compute();
			await wait(this.intervalSeconds);
		}
	}
}
