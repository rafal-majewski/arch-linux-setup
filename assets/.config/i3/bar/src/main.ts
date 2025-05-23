#!/usr/bin/env -S deno run --allow-all
import {MessageSegmentProvider} from "./core/message-segment-provider/MessageSegmentProvider.ts";
import {run} from "./core/running/run.ts";
import {BatteryStatusMessageSegmentComputer} from "./message-segment-computer-implementations/battery-status/BatteryStatusMessageSegmentComputer.ts";
import {TimestampMessageSegmentComputer} from "./message-segment-computer-implementations/timestamp/TimestampMessageSegmentComputer.ts";
import {VolumeStatusMessageSegmentComputer} from "./message-segment-computer-implementations/volume-status/VolumeStatusMessageSegmentComputer.ts";
await run([
	new MessageSegmentProvider(new BatteryStatusMessageSegmentComputer(), 8),
	new MessageSegmentProvider(new VolumeStatusMessageSegmentComputer(), 1),
	new MessageSegmentProvider(new TimestampMessageSegmentComputer(), 1),
]);
