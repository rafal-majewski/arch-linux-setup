import {MessageSegmentProvider} from "../../message-segment-provider/MessageSegmentProvider.ts";
import type {Job} from "../job/Job.ts";
export function createJobs(
	providers: readonly MessageSegmentProvider[],
): readonly Job[] {
	return providers.map(
		(computer): Job => ({
			generator: computer.provide(),
			value: null as string | null,
		}),
	);
}
