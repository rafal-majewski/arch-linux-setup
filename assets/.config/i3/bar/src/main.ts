#!/usr/bin/env -S deno run --allow-run
import {run} from "./core/running/run.ts";
import {BatteryStatusMessageSegmentComputer} from "./message-segment-computer-implementations/battery-status/BatteryStatusMessageSegmentComputer.ts";
import {TimestampMessageSegmentComputer} from "./message-segment-computer-implementations/timestamp/TimestampMessageSegmentComputer.ts";
import {VolumeStatusMessageSegmentComputer} from "./message-segment-computer-implementations/volume-status/VolumeStatusMessageSegmentComputer.ts";
const batteryStatusMessageSegmentComputer =
	new BatteryStatusMessageSegmentComputer();
const volumeStatusMessageSegmentComputer =
	new VolumeStatusMessageSegmentComputer();
new VolumeStatusMessageSegmentComputer();
const timestampMessageSegmentComputer = new TimestampMessageSegmentComputer();
const messageSegmentComputers = [
	batteryStatusMessageSegmentComputer,
	volumeStatusMessageSegmentComputer,
	timestampMessageSegmentComputer,
] as const;
await run(messageSegmentComputers);
