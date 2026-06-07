/* eslint-env node */
module.exports = {
  root: true,
  parser: "@typescript-eslint/parser",
  parserOptions: { ecmaVersion: 2022, sourceType: "module", ecmaFeatures: { jsx: true } },
  plugins: ["@typescript-eslint"],
  extends: [],
  rules: {
    // Force Lucide imports through @/components/ui/icons.
    "no-restricted-imports": ["error", {
      paths: [
        {
          name: "lucide-react",
          message: "Import icons via `Icons.foo` from '@/components/ui/icons'. Add new icons to iconMap there.",
        },
        {
          name: "@tabler/icons-react",
          message: "Tabler exists only as a fallback inside icons.tsx for brand glyphs Lucide lacks. Use Icons.foo.",
        },
        {
          name: "@phosphor-icons/react",
          message: "Use Icons.foo from '@/components/ui/icons'.",
        },
      ],
    }],
    // Forbid raw console in production code (use logger in server/ or proper UX in client/)
    "no-console": ["warn", { allow: ["warn", "error"] }],
  },
  overrides: [
    {
      // The Icons file itself is allowed to import from lucide-react.
      files: ["client/src/components/ui/icons.tsx"],
      rules: { "no-restricted-imports": "off" },
    },
    {
      // Tests can console.* freely.
      files: ["**/*.test.ts", "**/*.test.tsx"],
      rules: { "no-console": "off" },
    },
  ],
  ignorePatterns: ["node_modules", "dist", "drizzle/migrations", "*.config.*"],
};
