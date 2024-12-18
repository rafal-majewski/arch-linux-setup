export type Job = {
	readonly generator: AsyncGenerator<string, never, void>;
	value: string | null;
};
