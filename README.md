# ErasmusMC Bioinformatics Landing Page

## How to edit

icons: [fontawesome](http://fontawesome.io/icons/)

### Viewing changes locally

clone the repo, run `jekyll serve` from its root folder

open `http://localhost:4000/Translational-Bioinformatics/` in your browser

### Sections

Edit, rearrange, add, or remove in `_layouts/default.html`

### Services

### Projects

Project descriptions are in `/_posts` (Images are in `/img/projects`)

The naming convention of these files is important, and must follow the format: `YEAR-MONTH-DAY-title.markdown`.

### Publications

Add to the list in `_config.yml`. Images should be placed in `/img/publications/` and named with the `name attribute` like `ega.png` and `fuma.png` for the examples below

```yaml
publications:
- title: Integration of EGA secure data access into Galaxy
  journal: F1000 Research
  url: https://f1000research.com/articles/5-2841
  name: ega
  abstract: High-throughput molecular profiling techniques are routinely generating vast amounts of data for translational medicine studies. Secure access controlled systems are needed to manage, store, transfer and distribute these data due to its personally identifiable nature. The European Genome-phenome Archive (EGA) was created to facilitate access and management to long-term archival of bio-molecular data.

- title: FuMa reporting overlap in RNA-seq detected fusion genes
  journal: Bioinformatics
  url: https://doi.org/10.1093/bioinformatics/btv721
  name: fuma
  abstract: blablabla
```

### Team

Team members and info are in `_config.yml` (Images are in `/img/team/`)

#### Credit
Theme based on [Agency bootstrap theme ](https://startbootstrap.com/template-overviews/agency/)
