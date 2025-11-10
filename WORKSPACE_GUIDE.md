# Workspace Organization Guide

Uniformisan sistem za organizaciju rada sa automatizovanim alatima.

## 🗂️ Struktura

```
Work/
├── archive/              # Arhivirani projekti po godinama
│   └── 2025/
├── personal/             # Lični projekti
├── products/             # Proizvodi u razvoju
│   ├── ai/
│   ├── tools/
│   └── platforms/
├── research/             # Istraživanja
│   ├── generative_ai/
│   ├── mlops/
│   └── papers/
├── shared/               # Deljeni resursi
│   ├── configs/          # Konfiguracije
│   ├── notebooks/        # Jupyter notebooks
│   ├── scripts/          # Utility skripte
│   ├── templates/        # Template-i
│   ├── dotfiles/         # Dotfiles
│   ├── docs/             # Dokumentacija
│   └── supplement/       # Workspace alati
└── work-projects/        # Profesionalni rad
    ├── clients/          # Klijentski projekti
    ├── internal/         # Interni projekti
    └── consulting/       # Konsalting
```

## 🚀 Brzo Pokretanje

### 1. Inicijalizacija Workspace-a

```bash
cd ~/Work/shared/supplement
./setup-workspace.sh
```

Ovo će kreirati kompletnu strukturu direktorijuma sa README fajlovima.

### 2. Postavi Alias (opciono ali preporučeno)

Dodaj u `~/.bashrc` ili `~/.zshrc`:

```bash
# Workspace helper
export WORK_ROOT="$HOME/Work"
alias workspace="$WORK_ROOT/shared/supplement/workspace-helper.sh"
```

Posle:
```bash
source ~/.bashrc  # ili source ~/.zshrc
```

## 📝 Komande

### Setup - Kreiraj/Osveži Strukturu
```bash
workspace setup
```

### New Project - Kreiraj Novi Projekat (interaktivno)
```bash
workspace new-project
```

Vodiće te kroz izbor kategorije i kreiranje osnovne strukture.

### Archive - Arhiviraj Projekat
```bash
workspace archive ~/Work/personal/stari-projekat
```

Automatski premešta projekat u `archive/GODINA/`.

### List - Prikaži Strukturu
```bash
workspace list
```

### Goto - Brza Navigacija
```bash
cd $(workspace goto personal)
cd $(workspace goto research)
cd $(workspace goto clients)
```

## 💡 Primeri Upotrebe

### Kreiranje Ličnog Projekta
```bash
cd ~/Work/personal
mkdir moj-novi-projekat
cd moj-novi-projekat
# ili koristi
workspace new-project  # izaberi opciju 1
```

### Kreiranje Proizvoda
```bash
cd ~/Work/products/ai
mkdir nova-ai-app
# ili
workspace new-project  # izaberi opciju 2
```

### Research Projekat
```bash
cd ~/Work/research/generative_ai
mkdir llm-experiment
# ili
workspace new-project  # izaberi opciju 3
```

### Klijentski Rad
```bash
cd ~/Work/work-projects/clients
mkdir ime-klijenta
cd ime-klijenta
mkdir projekat-1
# ili
workspace new-project  # izaberi opciju 4
```

## 📂 Shared Resources

### Configs
Stavi globalne konfiguracije koje se koriste u više projekata:
- `.prettierrc`
- `.eslintrc`
- VS Code settings
- Git configs

### Scripts
Utility skripte koje se često koriste:
```bash
~/Work/shared/scripts/
├── backup.sh
├── deploy-helper.sh
└── git-sync.sh
```

### Templates
Project templates i boilerplate kod:
```bash
~/Work/shared/templates/
├── python-project/
├── node-app/
└── jupyter-analysis/
```

### Notebooks
Reusable Jupyter notebooks:
```bash
~/Work/shared/notebooks/
├── data-analysis-template.ipynb
├── model-evaluation.ipynb
└── visualization-examples.ipynb
```

## 🔄 Workflow Preporuke

### Početak Novog Projekta
1. Odluči kategoriju (personal/product/research/work)
2. Koristi `workspace new-project` ili ručno kreiraj
3. Kopiraj relevantne template-e iz `shared/templates/`
4. Inicijalizuj git ako je potrebno

### Arhiviranje Završenih Projekata
```bash
# Kada projekat više nije aktivan
workspace archive ~/Work/personal/zavrseni-projekat

# Ili ručno
mv ~/Work/personal/zavrseni-projekat ~/Work/archive/2025/
```

### Deljenje Resursa
```bash
# Kad napraviš korisnu skriptu
cp moja-skripta.sh ~/Work/shared/scripts/

# Kad napraviš reusable config
cp .prettierrc ~/Work/shared/configs/

# Kad napraviš korisni notebook
cp analiza.ipynb ~/Work/shared/notebooks/
```

## 🎯 Best Practices

1. **README u Svakom Projektu**: Uvek kreiraj README.md sa:
   - Opis projekta
   - Setup instrukcije
   - Kako koristiti
   - Dependencies

2. **Konzistentno Imenovanje**:
   - Koristi lowercase
   - Zameni space sa `-` ili `_`
   - Primer: `my-awesome-project`

3. **Git per Projekat**: Svaki projekat ima svoj git repo

4. **Redovno Arhiviranje**: Jednom godišnje pregledaj i arhiviraj neaktivne projekte

5. **Backup Shared**: Shared direktorijum stavi u git ili backup

## 🔧 Customizacija

### Dodavanje Nove Kategorije

Edit `setup-workspace.sh` i dodaj u `DIRECTORIES` array:
```bash
"nova-kategorija/podkategorija"
```

### Dodavanje Custom Komandi

Edit `workspace-helper.sh` i dodaj novi case u main router.

## 🐛 Troubleshooting

### Skripta ne radi?
```bash
# Proveri permissions
ls -la ~/Work/shared/supplement/
# Ako nisu executable:
chmod +x ~/Work/shared/supplement/*.sh
```

### Alias ne radi?
```bash
# Proveri da li je sourced
source ~/.bashrc
# Testiraj
workspace help
```

### Struktura nije kreirana?
```bash
# Run setup ponovo
cd ~/Work/shared/supplement
./setup-workspace.sh
```

## 📚 Dodatno

- Sve README fajlove možeš customizovati po potrebi
- Skripte su modularnepa ih lako menjaj
- Koristi git za version control workspace alata

---

**Kreirano**: 2025-11-10
**Lokacija**: `~/Work/shared/supplement/`
**Alati**: `setup-workspace.sh`, `workspace-helper.sh`
