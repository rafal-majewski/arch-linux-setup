import type {Job} from "../../../job/Job.ts";
export function computeMessageSegmentsFromJobs(
	jobs: readonly Job[],
): readonly string[] {
	const messageSegments: readonly string[] = jobs
		.map((job: Job) => job.value)
		.filter((messageSegment) => messageSegment !== null);
	return messageSegments;
}
