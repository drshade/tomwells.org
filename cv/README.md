# Tom's 2-page CV

Typst source for the official PDF linked from tomwells.org/cv.

- `cv.typ` – content. `style.typ` – layout, fonts, colours.
- `fonts/` – vendored IBM Plex Mono + Sans (SIL OFL, see `LICENSE-OFL.txt`) so local and CI renders are identical.
- `assets/` – images used by the PDF.

Build: `npm run cv` → `public/cv/tom-wells.pdf` (gitignored).
Iterate: `npm run cv:watch` and open the PDF in a viewer that auto-reloads.

The document asserts it is exactly two pages; the build fails if it drifts.
GitHub Actions (`.github/workflows/build-and-deploy.yml`) installs the pinned typst version
and runs `npm run cv` before `npm run bundle`, so the PDF ships with the site at `/cv/tom-wells.pdf`.

The contribution calendar under "Throughput" is drawn from `assets/contributions.json`.
Refresh it locally with `cv/scripts/fetch-contributions.sh` (needs `gh auth login`). CI refreshes it
automatically on every build when the `CONTRIBUTIONS_TOKEN` secret (a classic PAT with only
`read:user`) is set, and a weekly schedule redeploys the site so the calendar never goes stale.
The committed file is the fallback when the token is absent or the fetch fails.
