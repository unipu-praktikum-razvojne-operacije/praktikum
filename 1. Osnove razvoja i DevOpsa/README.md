# Tjedan 1: Osnovno o razvoju aplikacijskog softvera i razvojnih operacija

Termin: 180 min = blok A (80 min) + pauza (20 min) + blok B (80 min).
Ishodi učenja koje tjedan pokriva: 1 (prepoznati koncepte i alate), 2 (razlikovati okruženja, uvodno).

| Datoteka | Sadržaj |
|---|---|
| [blok-a-predavanje.md](blok-a-predavanje.md) | Uvod u kolegij, SDLC, DevOps, CI, hardver i produkcijski sustavi |
| [blok-b-vjezba.md](blok-b-vjezba.md) | Vježba: WSL, git, gh CLI, Python + venv, prvi push |
| [blok-c-vjezba.md](blok-c-vjezba.md) | Vježba: osnove Linuxa (datoteke, htop, apt i distribucije, ssh, sftp) |
| [check_env.sh](check_env.sh) | Skripta kojom student i nositelj provjeravaju je li okruženje ispravno |
| [primjer-release-please/](primjer-release-please/) | Primjer workflowa i datoteka za release-please (kopirati u korijen repozitorija) |

## GitHub konfiguracija
- U postavkama organizacije (Settings → Actions → General) dopustiti GitHub Actionsu stvaranje pull requestova, inače release-please ne može otvoriti release PR.
- Naziv repozitorija: `praktikum-<github-korisnik>`.

## Predaja (praktični zadatak 1)
Osobni repozitorij `praktikum-<github-korisnik>` u organizaciji, s `README.md`, `.gitignore`, `check_env.sh`, izlazom provjere (`check_env.txt`), te `.github/workflows/release_please.yml` i `version.txt`. Na kraju bloka postoji izdanje `v1.0.0`.
