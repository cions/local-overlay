import path from "node:path";
import { readFileSync } from "node:fs";

function unique(a: string[]) {
	return [...new Set(a)].toSorted();
}

if (process.argv.length < 3) {
	console.error("usage: bun bun-dependencies.ts <bun source dir>");
	process.exit(1);
}
const sourceDir = path.resolve(process.argv[2]);
process.chdir(sourceDir);

const { resolveConfig } = await import(`${sourceDir}/scripts/build/config.ts`);
const { allDeps } = await import(`${sourceDir}/scripts/build/deps/index.ts`);

const vendor: string[] = [];
let bunGitSha = (await Bun.$`git rev-parse HEAD`.text()).trimEnd();
let webkitVersion = "";
let nodejsVersion = "";

const toolchain = {
	cc: "clang",
	cxx: "clang++",
	ar: "llvm-ar",
	ld: "ld.lld",
	strip: "llvm-strip",
	cmake: "cmake",
	bun: "bun",
	jsRuntime: "node",
	esbuild: "esbuild",
	cargo: "cargo",
	hostCc: "clang",
	hostCxx: "clang++"
};
const cfg = resolveConfig({ buildType: "Release", webkit: "local", os: "linux", arch: "x64", abi: "gnu", linuxSysroot: "/" }, toolchain);
webkitVersion = cfg.webkitVersion;
for (const dep of allDeps) {
	if (dep.enabled && !dep.enabled(cfg)) continue;
	const src = typeof dep.source === "function" ? dep.source(cfg) : dep.source;
	if (src.kind === "github-archive") {
		vendor.push(`${dep.name} ${src.repo} ${src.commit}`);
	} else if (src.kind === "prebuilt" && dep.name === "nodejs") {
		nodejsVersion = `v${src.identity}`;
	}
}

// Rust cratse
const CRATES_IO = "registry+https://github.com/rust-lang/crates.io-index";
const rustSysroot = (await Bun.$`rustc --print sysroot`.text()).trimEnd();
const crates = Bun.TOML.parse(readFileSync(`${sourceDir}/Cargo.lock`))["package"]
	.concat(Bun.TOML.parse(readFileSync(`${rustSysroot}/lib/rustlib/src/rust/library/Cargo.lock`))["package"])
	.filter((p) => p["source"] === CRATES_IO)
	.map((p) => `${p["name"]}@${p["version"]}`);

// NPM packages
const lockfiles = ["bun.lock", "packages/bun-error/bun.lock", "src/node-fallbacks/bun.lock"];
const npmPackages = lockfiles.flatMap((lockfile) => {
	return unique(Object.values(Bun.JSONC.parse(readFileSync(path.join(sourceDir, lockfile)))["packages"])
		.map((p) => ({ spec: p[0], metadata: p[2] ?? {} }))
		.filter(({ spec }) => !spec.includes("@workspace:"))
		.filter(({ metadata }) => (metadata["os"] ?? "linux") === "linux")
		.filter(({ metadata }) => (metadata["cpu"] ?? "x64") === "x64")
		.map(({ spec }) => `${spec} ${path.dirname(lockfile)}`));
});

console.log("BUN_VENDOR=(");
unique(vendor).forEach((x) => console.log(`\t"${x}"`));
console.log(")");
console.log(`BUN_WEBKIT_COMMIT="${webkitVersion}"`);
console.log(`BUN_NODEJS_VERSION="${nodejsVersion}"`);
console.log(`BUN_GIT_SHA="${bunGitSha}"`);
console.log('CRATES="');
unique(crates).forEach((x) => console.log(`\t${x}`));
console.log('"');
console.log("NPM_PKGS=(");
npmPackages.forEach((x) => console.log(`\t"${x}"`));
console.log(")");
