import type {MessageSegmentComputer} from "../../MessageSegmentComputer.ts";
import type {MessageSegmentComputerVisitor} from "../../visitor/MessageSegmentComputerVisitor.ts";
export abstract class SynchronousMessageSegmentComputer
	implements MessageSegmentComputer
{
	public abstract readonly intervalSeconds: number;
	public acceptVisitor<ReturnValue>(
		visitor: MessageSegmentComputerVisitor<ReturnValue>,
	): ReturnValue {
		return visitor.visitSynchronousComputer(this);
	}
	public abstract compute(): string;
	public constructor() {}
}
