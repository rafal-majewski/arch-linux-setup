import type {MessageSegmentComputer} from "../../core/message-segment-computer/MessageSegmentComputer.ts";
import {formatTimestamp} from "./formatting/formatTimestamp.ts";
export class TimestampMessageSegmentComputer implements MessageSegmentComputer {
	public async compute(): Promise<string> {
		const timestamp = new Date();
		return formatTimestamp(timestamp);
	}
}
