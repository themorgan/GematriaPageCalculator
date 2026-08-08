(function () {
  // ---- Settings you can tweak ----
  const TRIGGER_KEY = "g"; // pressed with Ctrl (or Cmd on Mac) to toggle all annotations
  // --------------------------------

  const CLASS_BASE = "wva-word-value";
  let active = false;

  // Latin: a = 1 ... z = 26. Accented/diacritic letters count as their base
  // letter (á, à, â, ã, ä, å -> a = 1; ñ -> n; ç -> c; etc.), and stay part of
  // the same word ("não" is treated exactly like "nao").
  //
  // Most accents are handled automatically by Unicode NFD decomposition, which
  // splits e.g. "á" into "a" + a combining accent mark that we then drop. A few
  // European letters have no such decomposition, so they're mapped explicitly:
  const SPECIAL = {
    "\u00F8": "o",  // ø  Danish / Norwegian
    "\u00E6": "ae", // æ  Danish / Norwegian / Icelandic
    "\u0153": "oe", // œ  French
    "\u00DF": "ss", // ß  German (sharp s)
    "\u0142": "l",  // ł  Polish
    "\u0111": "d",  // đ  Croatian / Vietnamese
    "\u0127": "h",  // ħ  Maltese
    "\u0131": "i",  // ı  Turkish dotless i
    "\u0140": "l",  // ŀ  Catalan (l with middle dot)
    "\u00F0": "d",  // ð  Icelandic eth
    "\u00FE": "th"  // þ  Icelandic thorn
  };

  function latinValue(word) {
    // decompose accents, lowercase, then strip the combining marks
    const base = word.normalize("NFD").toLowerCase().replace(/[\u0300-\u036F]/g, "");
    let sum = 0;
    for (const ch of base) {
      const c = ch.charCodeAt(0);
      if (c >= 97 && c <= 122) {
        sum += c - 96;                       // a-z
      } else if (SPECIAL[ch]) {
        const b = SPECIAL[ch];               // e.g. "ß" -> "ss"
        for (let i = 0; i < b.length; i++) sum += b.charCodeAt(i) - 96;
      }
      // anything else (unmapped symbol) contributes 0
    }
    return sum;
  }

  // Hebrew: traditional gematria. Regular letters run 1-400; the five final
  // (sofit) forms use the large "mispar gadol" values 500-900. Vowel points
  // (niqqud) and cantillation marks carry no value.
  const HEBREW_VALUES = {
    "\u05D0": 1,   // א  aleph
    "\u05D1": 2,   // ב  bet
    "\u05D2": 3,   // ג  gimel
    "\u05D3": 4,   // ד  dalet
    "\u05D4": 5,   // ה  he
    "\u05D5": 6,   // ו  vav
    "\u05D6": 7,   // ז  zayin
    "\u05D7": 8,   // ח  chet
    "\u05D8": 9,   // ט  tet
    "\u05D9": 10,  // י  yod
    "\u05DB": 20,  // כ  kaf
    "\u05DC": 30,  // ל  lamed
    "\u05DE": 40,  // מ  mem
    "\u05E0": 50,  // נ  nun
    "\u05E1": 60,  // ס  samekh
    "\u05E2": 70,  // ע  ayin
    "\u05E4": 80,  // פ  pe
    "\u05E6": 90,  // צ  tsadi
    "\u05E7": 100, // ק  qof
    "\u05E8": 200, // ר  resh
    "\u05E9": 300, // ש  shin
    "\u05EA": 400, // ת  tav
    "\u05DA": 500, // ך  final kaf
    "\u05DD": 600, // ם  final mem
    "\u05DF": 700, // ן  final nun
    "\u05E3": 800, // ף  final pe
    "\u05E5": 900  // ץ  final tsadi
  };
  function hebrewValue(word) {
    let sum = 0;
    for (const ch of word) sum += HEBREW_VALUES[ch] || 0;
    return sum;
  }

  // A "word" is a run of Latin letters (including accented/diacritic forms and
  // combining marks) OR a run of Hebrew letters (plus attached points/marks).
  // The two runs never mix, so each match is entirely one script.
  const LATIN_CHARS = "A-Za-z\\u00C0-\\u00D6\\u00D8-\\u00F6\\u00F8-\\u00FF\\u0100-\\u024F\\u0300-\\u036F\\u1E00-\\u1EFF";
  const HEBREW_CHARS = "\\u0591-\\u05BD\\u05BF\\u05C1\\u05C2\\u05C4\\u05C5\\u05C7\\u05D0-\\u05EA";
  const WORD_RE = new RegExp("[" + LATIN_CHARS + "]+|[" + HEBREW_CHARS + "]+", "g");
  // does this text node contain any actual letter worth annotating?
  const TEST_RE = /[A-Za-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u00FF\u0100-\u024F\u1E00-\u1EFF\u05D0-\u05EA]/;
  // is this token a Latin word (vs. Hebrew)?
  const IS_LATIN = /[A-Za-z\u00C0-\u00D6\u00D8-\u00F6\u00F8-\u00FF\u0100-\u024F\u1E00-\u1EFF]/;

  function valueFor(token) {
    return IS_LATIN.test(token) ? latinValue(token) : hebrewValue(token);
  }

  const SKIP_TAGS = new Set([
    "SCRIPT", "STYLE", "NOSCRIPT", "TEXTAREA", "INPUT",
    "SELECT", "OPTION", "CODE", "PRE"
  ]);

  function shouldSkip(node) {
    const p = node.parentElement;
    if (!p) return true;
    if (SKIP_TAGS.has(p.tagName)) return true;
    if (p.closest && p.closest("." + CLASS_BASE)) return true; // never annotate our own output
    if (p.isContentEditable) return true;
    return false;
  }

  function annotate() {
    const walker = document.createTreeWalker(
      document.body,
      NodeFilter.SHOW_TEXT,
      {
        acceptNode(node) {
          if (!node.nodeValue || !TEST_RE.test(node.nodeValue)) return NodeFilter.FILTER_REJECT;
          return shouldSkip(node) ? NodeFilter.FILTER_REJECT : NodeFilter.FILTER_ACCEPT;
        }
      }
    );

    // Collect first, then mutate (mutating during walking is unsafe).
    const textNodes = [];
    let n;
    while ((n = walker.nextNode())) textNodes.push(n);

    for (const node of textNodes) {
      const text = node.nodeValue;
      const frag = document.createDocumentFragment();
      let lastIndex = 0;
      let m;
      WORD_RE.lastIndex = 0;
      while ((m = WORD_RE.exec(text)) !== null) {
        const end = m.index + m[0].length;
        frag.appendChild(document.createTextNode(text.slice(lastIndex, end)));
        const val = valueFor(m[0]);
        if (val > 0) {
          const span = document.createElement("span");
          span.className = CLASS_BASE;
          span.textContent = "[" + val + "]";
          frag.appendChild(span);
        }
        lastIndex = end;
      }
      if (lastIndex < text.length) frag.appendChild(document.createTextNode(text.slice(lastIndex)));
      node.parentNode.replaceChild(frag, node);
    }
    active = true;
  }

  function removeAnnotations() {
    document.querySelectorAll("." + CLASS_BASE).forEach((el) => el.remove());
    if (document.body && document.body.normalize) document.body.normalize(); // merge split text back
    active = false;
  }

  function injectStyle() {
    if (document.getElementById("wva-style")) return;
    const style = document.createElement("style");
    style.id = "wva-style";
    style.textContent =
      "." + CLASS_BASE + "{" +
      "font-size:0.72em;" +      // a touch smaller than the text
      "color:#7c8db5;" +          // subtle blue-grey, clearly not the body text
      "opacity:0.75;" +           // a little lighter / less intrusive
      "margin:0 1px;" +
      "vertical-align:baseline;" +
      "user-select:none;" +       // stays out of the way when selecting text
      "direction:ltr;" +          // keep the [41] rendering left-to-right...
      "unicode-bidi:isolate;" +   // ...and isolated, so it sits cleanly next to RTL Hebrew
      "}";
    document.documentElement.appendChild(style);
  }

  document.addEventListener("keydown", function (e) {
    // Trigger is Ctrl+G (Windows/Linux) or Cmd+G (Mac). Require exactly one of them.
    const modifier = e.ctrlKey || e.metaKey;
    if (!modifier || e.altKey || e.shiftKey) return;

    if (e.key.toLowerCase() !== TRIGGER_KEY) return;

    e.preventDefault();
    injectStyle();
    if (active) removeAnnotations();
    else annotate();
  });
})();
