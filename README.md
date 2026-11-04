# Rashon Poole · Research portfolio

An Astro site deployed to GitHub Pages. Node.js replaces the previous Ruby/Jekyll setup.

## Run locally

Install Node.js 24 LTS, then open a terminal in this folder:

```powershell
npm ci
npm run dev
```

Open http://localhost:4321. Edits reload automatically. Press Ctrl+C to stop.
`./serve.ps1` is an optional shortcut that installs missing dependencies first.
Dependencies are isolated in `node_modules`; `package.json` lists them and
`package-lock.json` records exact versions. No Python environment is needed.

For an isolated Node runtime, start Docker Desktop in Linux containers mode and
run `docker compose up`. It serves the same address. Run `docker compose down`
to remove the container; installed dependencies remain cached in a named volume.

## Edit the site

- `src/pages/`: Home, Research, CV, and the 404 page.
- `src/drafts/projects.astro`: unpublished Projects page. To restore it, move
  it to `src/pages/projects.astro` and add its link to the shared navigation.
- `src/layouts/Layout.astro`: shared navigation, metadata, and footer.
- `src/components/PaperCard.astro`: paper description and featured card.
- `src/data/site.ts`: email, CV, social profiles, and paper link.
- `src/styles/global.css`: typography, colors, spacing, and responsive layouts.
- `public/`: files copied unchanged to the published site, including the portrait.
- `public/documents/`: the CV PDF and research documents.
  The paper PDF, system diagram PDF, and figures live together in `personalized-alignment/`.
  Replace `cv.pdf` here to update the CV linked from the site.

Add `.astro` pages in `src/pages/` for new sections, or Markdown pages with a
`layout: ../layouts/Layout.astro` frontmatter field for writing-heavy pages.
The previous homepage content is preserved in `archive/index.md` for reference;
it is not included in the built site.

## Verify the production build

```powershell
npm run check
npm run build
npm run preview
```

Open http://localhost:4321 to preview the generated `dist/` directory.

## Deploy to GitHub Pages

1. Commit and push the migration, including `package-lock.json` and `public/`.
2. In the repository's **Settings → Pages → Build and deployment**, select
   **GitHub Actions** as the source (replacing the previous branch/Jekyll build).
3. The **Deploy Astro to GitHub Pages** workflow builds pushes to `main` and
   publishes the site. Run it manually from Actions if necessary after changing
   the Pages setting. Pull requests are checked and built without deploying.

The site URL is `https://rashonp.github.io`; this user-site repository needs no
repository-name base path. For a different host, update `site` in
`astro.config.mjs`. The workflow follows the static artifact deployment approach
in the [Astro GitHub Pages guide](https://docs.astro.build/en/guides/deploy/github/).
