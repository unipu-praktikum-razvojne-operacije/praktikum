# Tjedan 2: Verzioniranje i kolaborativno programiranje s gitom

Termin: 180 min = blok A (80 min) + pauza (20 min) + blok B (80 min).
Ishodi učenja koje tjedan pokriva: 1 (prepoznati koncepte i alate), 3 (primijeniti alate za kolaborativni razvoj).

| Datoteka | Sadržaj |
|---|---|
| [blok-a-predavanje.pptx](blok-a-predavanje.pptx) | Verzioniranje (tko, kada, zašto), strategije spajanja (fast-forward, merge commit, squash, rebase), strategije razvoja (okruženje = grana, Actions, tajne, zaštita grana, RBAC) |
| [blok-a-vjezba.md](blok-a-vjezba.md) | Vježba: zajednički repozitorij, vlastita grana, pull request prema `main`, spajanje uživo |
| [add_contribution.sh](add_contribution.sh) | Skripta za vježbu bloka A: datoteka `<Europe/Zagreb ISO vrijeme>.txt` s `$USER` + prazan commit |
| [blok-b-vjezba.md](blok-b-vjezba.md) | Vježba: Ollama lokalno, Python klijent i CLI, 5 pytest testova |
| [instructor-notes.md](instructor-notes.md) | Samo za nastavnika (u `.gitignore`): zašto ne rebaseati `main`, `git fetch` demo, priprema tri demo PR-a |
| [ollama-lab/](ollama-lab/) | Gotov kod za blok B (`ollama_client.py`, `llm.py`, `requirements.txt`, `.env.example`) i referentno rješenje testova u `solution/` |

## Raspored bloka A (80 min)
| Cjelina | Slajdovi | Okvirno |
|---|---|---|
| Verzioniranje izvornog koda | 3–7 | 10 min |
| Strategije spajanja promjena | 8–14 | 17 min |
| Strategije razvoja na GitHubu | 15–19 | 12 min |
| Vježba: zajednički repozitorij | 20–23 + [blok-a-vjezba.md](blok-a-vjezba.md) | 36 min |
| Provjera razumijevanja | 24 | 5 min |

## Priprema (nositelj)
- Prije termina stvoriti repozitorij `shared-collab` u organizaciji, dati timu studenata Write i zaštititi `main` (naredbe u [blok-a-vjezba.md](blok-a-vjezba.md#0-priprema-repozitorija-nositelj-prije-termina)).
- Podijeliti `add_contribution.sh` studentima.
- Ime datoteke sadrži `:`, što Windows ne dopušta: studenti rade u WSL-u, ne s Git for Windows.

## Predaja (praktični zadatak 2)
1. Spojen PR u `shared-collab` s vlastitom datotekom (blok A).
2. Spojen PR u `praktikum-<github-korisnik>` s Ollama klijentom, CLI-jem i `pytest.txt` u kojem piše `5 passed` (blok B).
