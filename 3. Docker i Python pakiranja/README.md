# Tjedan 3: Docker i Python pakiranje

Termin: 180 min = blok A (80 min) + pauza (20 min) + blok B (80 min). Blok C (Python pakiranje, 80 min) je zaseban blok vježbi koji se nastavlja na blok B.
Ishodi učenja koje tjedan pokriva: 1 (prepoznati koncepte i alate: kontejnerizacija, CLI alati), 2 (razlikovati okruženja: ista slika lokalno i na poslužitelju, konfiguracija iz okoline), 5 (evaluirati rješenje: veličina slike, ne-root korisnik, uredno gašenje).

> **Ishod bloka A:** student zna objasniti zašto koristimo kontejnere i po čemu se razlikuju od virtualnih strojeva, kako CLI razgovara s daemonom kroz socket u Docker Desktopu, Docker Engineu i dind-u, kako se kontejneri pronalaze po imenu na mreži, kako se gradi slika (slojevi, cache, multi-stage, ne-root korisnik, `.dockerignore`, tagovi i registri) i što se događa kad se kontejner gasi.
>
> **Ishod bloka B:** otvoren pull request `feature/docker` u `praktikum-<github-korisnik>`: CLI alat iz tjedna 2 ima `--version` (funkcija `read_version()`), handler za SIGTERM i multi-stage Docker sliku (faze `base`, `test`, `runtime`) koja prolazi testove, radi kao ne-root korisnik i gasi se uredno. Kriteriji prihvaćanja su na vrhu [blok-b-vjezba.md](blok-b-vjezba.md).
>
> **Ishod bloka C:** otvoren pull request `feature/python-package`: alat je Python paket `praktikum_llm` s `pyproject.toml`, naredbom `llm` i verzijom iz metapodataka, a Dockerfile u fazi `build` gradi wheel koji `runtime` samo instalira. Kriteriji prihvaćanja su na vrhu [blok-c-vjezba.md](blok-c-vjezba.md).

| Datoteka | Sadržaj |
|---|---|
| [blok-a-predavanje.pptx](blok-a-predavanje.pptx) | Docker: problem okruženja, kontejner vs VirtualBox, namespaces i cgroups, klijent/daemon/socket, Desktop vs Engine vs dind, mreže i DNS po imenu, Dockerfile, slojevi i cache, multi-stage, ne-root korisnik, datotečni sustav, `.dockerignore`, tagovi i registri, slika vs kontejner, naredbe, SIGTERM |
| [blok-b-vjezba.md](blok-b-vjezba.md) | Vježba: ubuntu, debian-slim i alpine; mreže; kontejnerizacija CLI alata; `read_version()` i SIGTERM; multi-stage Dockerfile bez build faze; predaja kao PR |
| [blok-c-vjezba.md](blok-c-vjezba.md) | Vježba: modul vs paket; pretvorba u paket (`src/`, `pyproject.toml`); Dockerfile s build fazom (wheel); implikacije na deployment; predaja kao PR |
| [docker-lab/blok-b/](docker-lab/blok-b/) | Rješenje bloka B: `llm.py`, `ollama_client.py`, `requirements*.txt`, `tests/`, `Dockerfile`, `.dockerignore` |
| [docker-lab/blok-c/](docker-lab/blok-c/) | Rješenje bloka C: `pyproject.toml`, `src/praktikum_llm/`, `tests/`, `Dockerfile`, `.dockerignore` |

## Raspored bloka A (80 min)
| Cjelina | Slajdovi | Okvirno |
|---|---|---|
| Naslov i sadržaj bloka | 1–2 | 2 min |
| Zašto Docker | 3–6 | 12 min |
| Arhitektura i varijante | 7–11 | 16 min |
| Umrežavanje | 12–14 | 10 min |
| Snimanje slike | 15–23 | 25 min |
| Kontejneri | 24–28 | 12 min |
| Provjera razumijevanja | 29 | 3 min |

## Raspored bloka B (80 min)
| Korak u [blok-b-vjezba.md](blok-b-vjezba.md) | Okvirno |
|---|---|
| Ishod vježbe, 0. Docker na računalu (instalacija kod kuće, ovdje samo provjera) | 5 min |
| 1. Prvi kontejneri: ubuntu, debian-slim, alpine | 15 min |
| 2. Mreže: ime kontejnera kao DNS ime | 8 min |
| 3. Kontejnerizacija CLI alata kakav jest | 17 min |
| 4. Verzija, SIGTERM i zadane vrijednosti u kodu | 13 min |
| 5. Multi-stage Dockerfile: base, test, runtime | 15 min |
| 6. Provjere i pull request | 7 min |

## Raspored bloka C (80 min)
| Korak u [blok-c-vjezba.md](blok-c-vjezba.md) | Okvirno |
|---|---|
| Ishod vježbe, 0. Grana | 5 min |
| 1. Modul i paket | 10 min |
| 2. Pretvorba modula u paket | 30 min |
| 3. Dockerfile s build fazom | 15 min |
| 4. Što pakiranje mijenja u deploymentu | 10 min |
| 5. Provjere i pull request | 10 min |

## Priprema
- **Studenti, prije termina:** instalirati Docker (korak 0 u [blok-b-vjezba.md](blok-b-vjezba.md)) i preuzeti slike da se na nastavi ne čeka mreža:
  ```bash
  for image in ubuntu:24.04 debian:trixie-slim alpine:3.24 nginx:alpine python:3.13-alpine; do docker pull "$image"; done
  ```
- Ollama iz tjedna 2 mora raditi na računalu studenta (`curl http://localhost:11434`).
- Polazište je stanje osobnog repozitorija nakon spojenog PR-a iz tjedna 2 (`ollama_client.py`, `llm.py`, `tests/`, `requirements.txt`, `version.txt`).

## Predaja (praktični zadatak 3)
- Blok B: otvoren pull request iz `feature/docker` u `main`, s `docker.txt` koji potvrđuje kriterije 1–5 (kriterij 6 provjerava se iz poruke commita i naslova PR-a).
- Blok C: otvoren pull request iz `feature/python-package` (prema `feature/docker` dok PR iz bloka B nije spojen), s `docker.txt` koji potvrđuje kriterije 1–5 (kriterij 6 provjerava se iz poruke commita i naslova PR-a).

PR-ove ne spajati sami; ostaju otvoreni za pregled.
