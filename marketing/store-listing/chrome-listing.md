# Chrome Web Store — Developer Dashboard draft copy

**Name:** Gematria Page Calculator

**Category:** Productivity (or Tools)

**Short description (132 char max):**
Press Ctrl+G to annotate every word on any page with its gematria value — English/Latin and Hebrew.

**Detailed description:**
Gematria Page Calculator adds the numeric gematria value next to every word
on the current page, in a small unobtrusive superscript.

- English/Latin text uses simple a=1…z=26 letter-sum gematria. Accented
  and diacritic letters (á, ñ, ç, ø, æ, ß, ł, đ, ħ, ı, ŀ, ð, þ, …) are
  counted as their base Latin letter.
- Hebrew text uses traditional gematria (mispar hechrachi), including the
  five sofit (final-letter) forms at their large values.

Toggle annotations on/off at any time with **Ctrl+G** (**Cmd+G** on Mac).
Nothing is sent anywhere — all calculation happens locally in the page.

**Privacy / permissions justification:**
The extension only runs as a content script that reads and modifies the
text of the current page to insert value labels; it requests no host
permissions beyond running on the pages the user is already viewing, and
sends no data anywhere.

**Screenshots:** see `../screenshots/` (none checked in yet).

**Icon:** see `../icon/` (placeholder pending the real artwork).
