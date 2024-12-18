import { SynchronousMessageSegmentComputer } from "../../core/message-segment-computer/types/synchronous/SynchronousMessageSegmentComputer.ts";

export class DateMessageSegmentComputer
	extends SynchronousMessageSegmentComputer {
	public override readonly intervalSeconds = 1;

	private formatDate(date: Date): string {
		const hourInFormattedDate = (date.getHours()).toString().padStart(
			2,
			"0",
		);

		const minuteInFormattedDate = (date.getMinutes()).toString().padStart(
			2,
			"0",
		);

		const secondInFormattedDate = (date.getSeconds()).toString().padStart(
			2,
			"0",
		);

		const dayInFormattedDate = (date.getDate()).toString().padStart(2, "0");

		const monthInFormattedDate = (date.getMonth() + 1).toString().padStart(
			2,
			"0",
		);

		const yearInFormattedDate = date.getFullYear().toString();
		return `${yearInFormattedDate}-${monthInFormattedDate}-${dayInFormattedDate} ${hourInFormattedDate}:${minuteInFormattedDate}:${secondInFormattedDate}`;
	}

	public override compute(): string {
		const date = new Date();
		const formattedDate = this.formatDate(date);
		return formattedDate;
	}
}
