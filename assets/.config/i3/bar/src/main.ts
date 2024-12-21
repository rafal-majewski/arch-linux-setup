#!/usr/bin/env -S deno run --allow-all
import {MessageSegmentProvider} from "./core/message-segment-provider/MessageSegmentProvider.ts";
import {run} from "./core/running/run.ts";
import {TimestampMessageSegmentComputer} from "./message-segment-computer-implementations/timestamp/TimestampMessageSegmentComputer.ts";
await run([
	new MessageSegmentProvider(new TimestampMessageSegmentComputer(), 1),
]);
