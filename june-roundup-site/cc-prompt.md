I have a finished single-page HTML slide deck (`index.html`) plus an `assets/` folder. It's a static site — no build step, no framework. Please do the following:

1. Drop these image files into `assets/` with these EXACT names (I'm providing the files):
   - `cloudinary.svg`  — Cloudinary logo (slide 5 partner lockup)
   - `aws.jpg`         — AWS Marketplace photo (slide 6, well 02)
   - `nikon.jpg`       — Nikon photo (slide 6, well 03)
   `assets/magnolia.svg` is already in place (slide 6, well 01). Don't rename the existing files or the `assets/` path — `index.html` already references all four.

2. Do NOT touch the image-fit CSS. All partner images use `object-fit: contain` on purpose (no crop, no distortion). Leave it as is.

3. Quick sanity check before deploy: open `index.html`, confirm all four images resolve (no broken-image icons, no fallback text), and that nothing overflows on slides 5 and 6 at 16:9.

4. Publish it publicly:
   - Create a new PUBLIC GitHub repo named `june-roundup-deck`, commit everything, push.
   - Deploy to Vercel as a production deployment (`vercel deploy --prod`), root = `index.html`.
   - Print the final public Vercel URL.

Assume `gh` and `vercel` CLIs are installed and authenticated. There's a `deploy.sh` in the folder that already does the git + vercel steps if you'd rather run that — `bash deploy.sh` creates the repo on first run and re-deploys on subsequent runs, printing the live URL at the end.

Keep changes minimal: this is just adding three image files and shipping it. Don't restyle anything.
