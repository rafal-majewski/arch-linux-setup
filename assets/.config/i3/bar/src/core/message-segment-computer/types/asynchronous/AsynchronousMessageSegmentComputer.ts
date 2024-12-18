import type {MessageSegmentComputer} from "../../MessageSegmentComputer.ts";
import type {MessageSegmentComputerVisitor} from "../../visitor/MessageSegmentComputerVisitor.ts";
export abstract class AsynchronousMessageSegmentComputer
	implements MessageSegmentComputer
{
	public abstract readonly intervalSeconds: number;
	public acceptVisitor<ReturnValue>(
		visitor: MessageSegmentComputerVisitor<ReturnValue>,
	): ReturnValue {
		return visitor.visitAsynchronousComputer(this);
	}
	public abstract compute(): Promise<string>;
	public constructor() {}
}
