import fs from "node:fs"

const target = "node_modules/@quartz-community/quartz-fonts/dist/index.js"
let src = fs.readFileSync(target, "utf8")

if (src.includes("cachedFetch")) {
  console.log("quartz-fonts ya está parcheado, nada que hacer.")
  process.exit(0)
}

const helper = `
var FONTS_CACHE = path.join(process.cwd(), ".fonts-cache");
async function cachedFetch(url, cacheFile) {
  try {
    return new Response(await fs.promises.readFile(cacheFile));
  } catch {}
  const res = await fetch(url);
  if (res.ok) {
    await fs.promises.mkdir(path.dirname(cacheFile), { recursive: true });
    await fs.promises.writeFile(cacheFile, Buffer.from(await res.clone().arrayBuffer()));
  }
  return res;
}
function hashKey(s) {
  return process.getBuiltinModule("node:crypto").createHash("sha1").update(s).digest("hex").slice(0, 12);
}
`

const replacements = [
  ["var FontsEmitter = (userOptions) => {", helper + "var FontsEmitter = (userOptions) => {"],
  [
    "const cssResponse = await fetch(href);",
    'const cssResponse = await cachedFetch(href, path.join(FONTS_CACHE, "css-" + hashKey(href) + ".css"));',
  ],
  [
    "const fontResponse = await fetch(fontFile.url);",
    'const fontResponse = await cachedFetch(fontFile.url, path.join(FONTS_CACHE, fontFile.filename + "." + fontFile.extension));',
  ],
]

for (const [from, to] of replacements) {
  if (src.split(from).length !== 2) {
    console.error("No encontré (o aparece más de una vez): " + from)
    process.exit(1)
  }
  src = src.replace(from, () => to)
}

fs.writeFileSync(target, src)
console.log("quartz-fonts parcheado: ahora usa .fonts-cache/ antes de ir a la red.")