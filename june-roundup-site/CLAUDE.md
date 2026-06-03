# June Roundup deck — build & deploy notes for Claude Code

Single-page TBSCG slide deck (`index.html`, self-contained HTML/CSS/JS, no build step).
Static site: deploy as-is, root is `index.html`.

## Outstanding before publish — add 3 image files to `assets/`

These were provided by the user but did not transfer as files. Drop them in with these exact names:

| File | Used on | Notes |
|---|---|---|
| `assets/cloudinary.svg` | Slide 5 (Cloudinary) partner lockup, bottom-right | the blue Cloudinary logo |
| `assets/aws.jpg` | Slide 6 well 02 | AWS Marketplace photo |
| `assets/nikon.jpg` | Slide 6 well 03 | Nikon camera photo (Pipeline) |

Already in place: `assets/magnolia.svg` (Magnolia Gold Partner badge, slide 6 well 01).

Until the three files exist, those slots fall back to a tone-on-tone partner name (no broken images), so the deck stays presentable.

## Image rendering rule

All partner images use `object-fit: contain` inside their wells — no crop, no distortion. Keep this. Do not switch to `cover`.

## Deploy

```
bash deploy.sh
```

First run needs `gh auth login` and `vercel login` once. The script creates a public GitHub repo `june-roundup-deck` on first run, pushes, then runs `vercel deploy --prod`. Re-run any time to push changes live. The public URL prints on the last line as `LIVE:`.

## Structure

- `index.html` — the deck (9 slides, arrow-key / click nav, persistent counter opens a slide picker)
- `assets/` — partner logos and photos
- `deploy.sh` — git + vercel publish
