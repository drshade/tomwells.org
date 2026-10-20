# Tom's 2-page CV

Typst source for the official PDF linked from tomwells.org/cv.

- `cv.typ` – content. `style.typ` – layout, fonts, colours.
- `fonts/` – vendored IBM Plex Mono + Sans (SIL OFL, see `LICENSE-OFL.txt`) so local and CI renders are identical.
- `assets/` – images used by the PDF.

Build: `npm run cv` → `public/cv/tom-wells.pdf` (gitignored).
Iterate: `npm run cv:watch` and open the PDF in a viewer that auto-reloads.

The document asserts it is exactly two pages; the build fails if it drifts.
CI installs the pinned typst version and runs `npm run cv` before `npm run bundle`,
so the PDF ships with the site at `/cv/tom-wells.pdf`.

The contribution calendar under "Throughput" is drawn from `assets/contributions.json`.
Refresh it with `cv/scripts/fetch-contributions.sh` (needs `gh auth login`) and commit the result.
