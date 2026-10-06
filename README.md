# schulexam

LaTeX-Dokumentklasse für Arbeitsblätter, Stegreifaufgaben und Schulaufgaben
(Staatliche Berufsschule 1 Landshut). Basiert auf der Klasse `exam` und ergänzt
Kopfzeilen (`\worksheetheader`, `\examheader`), Schullogo, Lücken in Tabellen
(`\tablefillin`) und einheitliches Layout.

```latex
\documentclass[ngerman]{schulexam}
```

## Inhalt

```
schulexam/
├── schulexam.cls              Die Klasse
├── images/                    Schullogo, Kleeblatt (von der Klasse eingebunden)
└── konventionen/
    ├── konventionen.md        Header-Setup, Befehle, Teil-A/B-Logik
    └── vorlagen/              Grundgerüste für Arbeitsblatt und Schulaufgabe
```

## Einbinden

LaTeX muss `schulexam.cls` **und** den Ordner `images/` finden. Drei Varianten:

### A — Als Git-Submodul im Kursprojekt (empfohlen für geteilte Projekte)

Jeder, der das Kursprojekt klont, bekommt automatisch die passende Version der Klasse.

```bash
git submodule add https://github.com/HerrSchwaiger/schulexam.git _extern/schulexam
```

Beim Bauen den Ordner in den Suchpfad aufnehmen, z. B. in `build.sh`:

```bash
export TEXINPUTS=".:$ROOT/_extern/schulexam//:"
```

bzw. in VS Code (LaTeX Workshop) über `latex-workshop.latex.tools` → `env`.

Klonen eines Projekts mit Submodul: `git clone --recurse-submodules <URL>` oder nachträglich
`git submodule update --init`. Klasse aktualisieren: `git submodule update --remote _extern/schulexam`
und die neue Version im Kursprojekt committen.

### B — TEXINPUTS global (ein Klon pro Rechner)

In `~/.zshrc` bzw. `~/.bashrc`:

```bash
export TEXINPUTS=".:/pfad/zu/schulexam//:"
```

`.` = aktueller Ordner · `//` = rekursiv (findet auch `images/`) · abschließendes `:` =
normaler TeX-Suchpfad bleibt erhalten.

### C — Symlink in den lokalen texmf-Baum

```bash
# macOS
mkdir -p ~/Library/texmf/tex/latex
ln -s /pfad/zu/schulexam ~/Library/texmf/tex/latex/schulexam
# Linux: ~/texmf/tex/latex statt ~/Library/texmf/tex/latex
```

Unter Windows (MiKTeX) den Pfad mit `kpsewhich -var-value TEXMFHOME` ermitteln.

Prüfen (B und C): `kpsewhich schulexam.cls` gibt den Pfad zur Klasse aus.

## Änderungen

Änderungen an der Klasse wirken sich auf alle Projekte aus, die sie einbinden. Projekte mit
Submodul sind auf eine Version festgenagelt und übernehmen Änderungen erst nach
`git submodule update --remote`.
