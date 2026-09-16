# LaTeX / schulexam: Konventionen

Gilt fuer Arbeitsblaetter, Stegreifaufgaben und Schulaufgaben, die mit dem `schulexam`-Paket erstellt werden.

## Grundgeruest

- Documentclass ist `schulexam` selbst, nicht `exam` + `\usepackage{schulexam}`:
  ```latex
  \documentclass[ngerman]{schulexam}
  ```
- Kein `\usepackage{listings}` noetig (von schulexam gehandhabt)
- Header-Makros vor `\begin{document}` definieren:
  ```latex
  \newcommand{\lehrkraft}{ScT}
  \newcommand{\fach}{AEuP}
  \newcommand{\examname}{<Titel>}
  \newcommand{\jahrgangsstufe}{10}
  ```
  Danach im Dokument `\worksheetheader` ohne Argumente aufrufen (Makro hat optionales Untertitel-Argument und eine Stern-Variante ohne Namenszeile).

## Lueckentexte

- Kurze Luecken im Fliesstext (z.B. ein Wort/eine Phrase im Satz): `\fillin[antwort][laenge]`, z.B.
  ```latex
  Das Zauberwort ist \fillin[zauberwort][2in].
  ```
- **In Tabellen** ist `\fillin`s eingebaute Unterstreichung (`\hrulefill`) redundant zum Zellenrand → eigener Befehl `\tablefillin{antwort}` (siehe `tablefillin-patch.tex` — muss in `schulexam.cls` selbst ergaenzt werden, nicht im Dokument wiederholt).
- Freie, handschriftliche Antworten (`solutionorlines`/`solution`): Antwort direkt in der Umgebung angeben.

## Punkte, Aufbau

- Keine Punktwerte, kein eigenes `lstdefinestyle` (von schulexam gehandhabt)
- **Teil A:** Wissenstransfer aus Informationsmaterial
- **Teil B:** handschriftliche Programmieraufgabe, ohne Praxis-/Szenario-Bezug

## Layout

- `\needspace`, um Aufgaben-Umbrueche mitten in einer Aufgabe zu verhindern
- `tabularx` mit vollen Rahmen fuer Tabellen
- Keine Gedankenstriche zwischen Saetzen

## Hintergrund

Langjaehriges Interesse an LaTeX fuer Unterrichtsmaterial-Produktion, u.a. Klausurautomatisierung (IHK-Notenschluessel, `schulexam`), UML-Diagramme mit TikZ, professionelles Deutsch in Aufgabentexten.
