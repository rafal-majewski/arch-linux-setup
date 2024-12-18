export interface MessageSegmentComputer {
	compute(): Promise<string>;
}
