# ErasmusMC Bioinformatics Landing Page

## How to edit

icons: [fontawesome](http://fontawesome.io/icons/)

### Previewing changes locally

install jekyll, clone this repo, and run `jekyll serve` from its root folder

open `http://localhost:4000` in your browser

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
- name: ega
  title: Integration of EGA secure data access into Galaxy
  journal: F1000 Research
  url: https://f1000research.com/articles/5-2841
  abstract: High-throughput molecular profiling techniques are routinely generating vast amounts of data for translational medicine studies. Secure access controlled systems are needed to manage, store, transfer and distribute these data due to its personally identifiable nature. The European Genome-phenome Archive (EGA) was created to facilitate access and management to long-term archival of bio-molecular data.

- name: fuma
  title: FuMa reporting overlap in RNA-seq detected fusion genes
  journal: Bioinformatics
  url: https://doi.org/10.1093/bioinformatics/btv721
  abstract: blablabla
```

### Team

Team members are listed in `_config.yml` Corresponding images should be placed in `/img/team/` and named with the `pic` attribute and jpg extension,
so `inmg/team/andrew.jpg` in the following example

```yaml
people:
- name: Andrew Stubbs
  pic: andrew
  position: Assistent Professor
  social:
    - title: linkedin
      url: https://www.linkedin.com/in/andrew-stubbs-036b0026/
    - title: github
      url: https://github.com/Andrew-EMC
```


#### Credit
Theme based on [Agency bootstrap theme ](https://startbootstrap.com/template-overviews/agency/)
