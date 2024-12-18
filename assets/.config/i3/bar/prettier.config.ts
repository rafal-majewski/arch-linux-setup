import type {Config} from "prettier";
export default {
	arrowParens: "always",
	bracketSpacing: false,
	endOfLine: "lf",
	experimentalOperatorPosition: "start",
	experimentalTernaries: true,
	objectWrap: "collapse",
	plugins: [],
	printWidth: 80,
	quoteProps: "as-needed",
	semi: true,
	singleQuote: false,
	trailingComma: "all",
	useTabs: true,
	overrides: [],
} as const satisfies Config;
