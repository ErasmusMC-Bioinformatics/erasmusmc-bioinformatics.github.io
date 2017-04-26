# ErasmusMC Bioinformatics Landing Page

## How to edit

### Previewing changes locally

install jekyll, clone this repo, and run `jekyll serve` from its root folder

open `http://localhost:4000` in your browser to preview your changes.

Once you are happy, push changes back to the repo and github will automatically rebuild the site

### Sections

Edit, rearrange, add, or remove in `_layouts/default.html`

### Services

- Add services to `_config.yml`.
- Icon names should be from [fontaswesome](http://fontawesome.io/icons/)

```yaml
services:
- name: Galaxy
  description: Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.
  icon: star

- name: FAIR data
  description: Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.
  icon: laptop
 ```

### Projects

Project descriptions are in `/_posts` (Images are in `/img/projects`)

The naming convention of these files is important, and must follow the format: `YEAR-MONTH-DAY-title.markdown`.

### Publications

- Add new publications to the list in `_config.yml`.
- Publications will be rendered in the order the appear in this file, please put them in in chronological order, with the newest at the top
- Images should be placed in `/img/publications/` and named with the `pic` attribute, e.g. `img/publications/ega.png` for the example below
- Use square images for best results
- Possible attributes: pic, title, journal, url, day, month, year, abstract
- Keep the abstract short (first couple sentences of full abstract or a custom description of paper); a `read more` link to the full article will be generated after this text.

```yaml
publications:
- title: Integration of EGA secure data access into Galaxy
  pic: ega.png
  journal: F1000 Research
  url: https://f1000research.com/articles/5-2841
  abstract: High-throughput molecular profiling techniques are routinely generating vast amounts of data for translational medicine studies. Secure access controlled systems are needed to manage, store, transfer and distribute these data due to its personally identifiable nature. The European Genome-phenome Archive (EGA) was created to facilitate access and management to long-term archival of bio-molecular data.
```

### Team Members

- Team members are listed in `_config.yml`
- Corresponding images should be placed in `/img/team/` and named with the `pic` attribute so `img/team/andrew.jpg` in the following example
- Use square image for the best results

```yaml
people:
- name: Andrew Stubbs
  pic: andrew.jpg
  position: Dear Leader
  social:
    - title: linkedin
      url: https://www.linkedin.com/in/andrew-stubbs-036b0026/
    - title: github
      url: https://github.com/Andrew-EMC
```

### Collaborations

This generates a bar of logos of collaborators. Logos should be placed in `img/logos`


```yaml
collaborations:
- name: elixir
  logo: elixir.png

- name: dtl
  logo: dtl.png
```

#### Credit
Theme based on [Agency bootstrap theme ](https://startbootstrap.com/template-overviews/agency/)
