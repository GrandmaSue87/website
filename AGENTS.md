# AGENTS.md

## Project overview
- We are building a simple website to host digital books for retro read along records.
- Each book can include audio and video portions.
- The site is called "Grandma Sue's Library" (Retro Read-Along Records).
- The short-term goal is a simple, working library homepage plus individual book pages.

## How to work with me
- I am a non-coder.
- Ask me questions one at a time.
- Keep explanations short and direct.
- Avoid overwhelming me with too much information.
- I have ADHD and get overwhelmed easily.
- Do not start coding until I explicitly approve.

## Desired help
- Help me plan the site structure and content.
- Help me design simple, clear pages.
- Suggest next steps in small, manageable chunks.

## Style preferences
- Vibe: midcentury modern grandmother's library; warm, cozy, nostalgic, but uncluttered and simple.
- Feel: light and airy; like snuggling by the hearth with cookies and stories.
- Background: soft paper/linen feel with faint, rounded shapes.
- Palette: warm wood + soft sage, creamy paper base, muted teal accent.
- Typography: storybook/classic for headings; clean, friendly sans for body.
- Thumbnails: square book covers; simple and consistent.

## Current fonts, colors, and style (from styles.css)
### Fonts
- Headings: "Cormorant Garamond" (weights 500–600), fallback "Times New Roman", serif.
- Body/UI: "Source Sans 3" (weights 400–600), fallback "Segoe UI", sans-serif.

### Color palette (CSS variables)
- --paper: #f7f1e6
- --paper-dark: #efe6d7
- --ink: #2f2a23
- --muted: #5f5a52
- --sage: #8e9d8c
- --teal: #4c8a7a
- --wood: #c39a6b
- --accent: #d58b5a
- --card: #fffaf1
- --shadow: 0 18px 40px rgba(47, 42, 35, 0.12)

### Style notes
- Background: layered radial gradients + subtle paper grain over --paper.
- Cards: soft rounded corners (22–24px), warm paper fill, soft drop shadow.
- Pills/tags: rounded, warm clay accents with bold small text.
- Buttons: rounded pill shapes; teal primary, warm clay secondary.
- Action icons: chunky, tactile tiles with soft bevel/gloss effect.

## Site structure
- Home page is the library with a hero and a grid of 8 book covers.
- One new book is added each Sunday evening.
- Each book has its own page.
- Future: About page and Listener Club/opt-in page.

## Homepage content
- Title: "Grandma Sue's Library".
- Hero text: "Welcome to the retro read-along library of Grandma Sue. You'll know it's time to turn the page, when you hear this sound..."
- Helper line: "New books arrive every Sunday evening."
- Cards show cover, tags (category/collection/year), title, and a short warm one-liner.

## Book page layout
- Top block: two columns with cover on the right and title/description on the left.
- Show basic info/tags using the metadata default below.
- Viewer: two-page spread (two square pages side-by-side) with left/right controls.
- Audio slider should include a live time readout in `current / total` format (example: `1:23 / 4:56`).
- Action icons (large and very clear): audio, YouTube, podcast, Amazon (only for originals later).
- Include hover tooltips on action icons and a short helper line.

## Book metadata default
- Use a small "core 6" on every book page for consistency.
- Core 6: title, year, author, illustrator, narrator, GSL Library No.
- Optional fields (only when useful): publisher, collection/series, archive/item number, origin/context note.

## Catalog system
- Format: GSL-XX-### (e.g., GSL-VR-001).
- GSL = Grandma Sue's Library (always first section).
- Second section: VR (vinyl read-along), SR (storybook read-along), OR (original read-along).
- Final section: a three-digit number that increments with each new book, regardless of type.

## Content checklist (weekly)
- Cover image (square).
- Two-page spreads (pair square pages into wide spreads).
- Audio file.
- YouTube link.
- Podcast link.
- Optional Amazon link.
- Title + short warm description.
- Basic info and tags.

## Repeatable book-page process (default)
- Use this process for each new weekly book page so layout/content stay cohesive.
- Start from template: `books/_book_page_template.html`

### 1) Gather assets + links
- Confirm folder name under `books/` (example: `books/GSL_SR_002`).
- Confirm cover + spread images are `.jpg` (convert from `.png` if needed).
- Confirm audio filename and available links (YouTube, podcast, optional Amazon).

### 2) Build top content block
- Use one warm blurb paragraph that includes: hook + vintage context + bonus-song note (if applicable).
- Do not split this into helper text unless explicitly requested.
- Keep tags to 3 concise items (typically category, collection, year).

### 3) Metadata list (core 6 default)
- Always include: title, year, author, illustrator, narrator, GSL Library No.
- Optional details (publisher, archive/item no., origin/context) should stay in blurb/context text unless needed in metadata list.

### 4) Viewer defaults
- Storybook pages should open on interior `spread 1` (not front/back cover in viewer) unless requested otherwise.
- Keep the top-right cover image in the hero section.
- Keep large left/right page-turn controls.

### 5) Audio controls defaults
- Keep progress slider with stable seeking behavior.
- Show live time readout on the right in `current / total` format (example `1:23 / 4:56`).

### 6) Extras/actions defaults
- Show audio/YouTube/podcast/Amazon icon row.
- If links are missing, keep icon disabled with clear tooltip text.
- Do not add extra helper line like “Audio is ready…” unless requested.

### 7) Homepage update
- Replace the next “Coming Soon” card with the new book card.
- Card should include: cover, tags, title, short one-liner, and link to the book page.

### 8) Final QA before handoff
- Verify all image paths match actual folder names (`jpg/` vs `png/`).
- Verify audio loads, play/pause works, slider seeks, and time readout updates.
- Verify viewer arrows navigate correctly across all spreads.
- Verify metadata uses the core 6 format and page copy has no repeated facts.

## Weekly image optimization (one book at a time)
- Goal sizes: pages 1200–1600 px square, ~200–500 KB each; covers ~300–700 KB.
- Use the script: `scripts/optimize_book_images.sh books/BOOK_FOLDER --delete`
- Example: `scripts/optimize_book_images.sh books/321_Peter_and_the_Wolf --delete`
- After converting, update the book HTML to use `.jpg` for pages and cover.

## Interaction ideas (later)
- Add a tiny chime play button near the welcome line.
- Add a page-turn animation for the spread viewer.
- Add finger swipe to turn pages on touch devices.

## Open decisions
- Finalize exact color palette values and font choices.
- Decide if/when to add search and filters (category/collection).
