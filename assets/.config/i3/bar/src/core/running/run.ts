import {MessageSegmentProvider} from "../message-segment-provider/MessageSegmentProvider.ts";
import {createJobs} from "./creating-jobs/createJobs.ts";
import {displayMessageFromJobs} from "./displaying-message-from-jobs/displayMessageFromJobs.ts";
import {Job} from "./job/Job.ts";
export async function run(
	providers: readonly MessageSegmentProvider[],
): Promise<void> {
	const jobs: readonly Job[] = createJobs(providers);
	displayMessageFromJobs(jobs);
	await Promise.all(
		jobs.map(async (job) => {
			for await (const newValue of job.generator) {
				job.value = newValue;
				displayMessageFromJobs(jobs);
			}
		}),
	);
}
