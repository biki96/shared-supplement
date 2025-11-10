# ⚡ Quick Start - Workspace Setup

## 1️⃣ Kreiraj Strukturu (jednom)

```bash
cd ~/Work/shared/supplement
./setup-workspace.sh
```

## 2️⃣ Postavi Alias (opciono)

Dodaj u `~/.bashrc` ili `~/.zshrc`:

```bash
export WORK_ROOT="$HOME/Work"
alias workspace="$WORK_ROOT/shared/supplement/workspace-helper.sh"
```

Reload:
```bash
source ~/.bashrc  # ili ~/.zshrc
```

## 3️⃣ Koristi!

```bash
# Novi projekat (interaktivno)
workspace new-project

# Prikaži strukturu
workspace list

# Brza navigacija
cd $(workspace goto personal)
cd $(workspace goto research)

# Arhiviraj projekat
workspace archive ~/Work/personal/stari-projekat

# Help
workspace help
```

## 📁 Gde Šta Ide?

| Kategorija | Putanja | Šta ide ovde? |
|------------|---------|---------------|
| **Lični projekti** | `~/Work/personal/` | Side projekti, eksperimenti |
| **Proizvodi** | `~/Work/products/ai/` | AI app-ovi, platforme |
| **Research** | `~/Work/research/generative_ai/` | Istraživanja, paper impl. |
| **Klijentski rad** | `~/Work/work-projects/clients/` | Profesionalni projekti |
| **Deljeno** | `~/Work/shared/` | Configs, skripte, templates |
| **Arhiva** | `~/Work/archive/2025/` | Završeni projekti |

## ✅ To-Do Nakon Setup-a

- [ ] Pomeri postojeće projekte u odgovarajuće foldere
- [ ] Stavi često korišćene configs u `shared/configs/`
- [ ] Kreiraj template-e u `shared/templates/`
- [ ] Git init u `shared/` za backup
- [ ] Arhiviraj stare projekte

---

Detaljniji vodič: [WORKSPACE_GUIDE.md](./WORKSPACE_GUIDE.md)
