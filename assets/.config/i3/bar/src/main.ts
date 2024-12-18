#!/usr/bin/env -S deno run --allow-run
import { run } from "./core/running/run.ts";
import { DateMessageSegmentComputer } from "./message-segment-computer-implementations/date/DateMessageSegmentComputer.ts";
import { VolumeMessageSegmentComputer } from "./message-segment-computer-implementations/volume/VolumeMessageSegmentComputer.ts";
const volumeMessageSegmentComputer = new VolumeMessageSegmentComputer();
const dateMessageSegmentComputer = new DateMessageSegmentComputer();

const messageSegmentComputers = [
	volumeMessageSegmentComputer,
	dateMessageSegmentComputer,
] as const;

await run(messageSegmentComputers);
