# ErasmusMC Bioinformatics Landing Page

## How to edit

Simply edit `_config.yml` to add your content!

add any images to the appropriate subfolder in `./img/`

### Previewing changes locally

install jekyll, clone this repo, make your changes, and run `jekyll serve` from its root folder

open `http://localhost:4000` in your browser to preview your changes.

Once you are happy, push changes back to the repo and github will automatically rebuild the site


### Services

- Add services to `_config.yml`.
- Icon names should be from [fontaswesome](http://fontawesome.io/icons/)
- If a service has an attribute `modal-id` it will pop up a page when user clicks on the logo

```yaml
services:
- name: Galaxy
  description: Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.
  icon: star
  modal-id: 1
  description:
    - paragraph: blabla
    - image: galaxy_logo.jpg
    - paragraph: blabla again

- name: FAIR data
  description: Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.
  icon: laptop
 ```

### Projects

- Add projects to `_config.yml`
- Images should he placed in `img/projects/`
- Thumbnail images should all be same ratio (400x290)
- Clicking on a project will lead to a new page, from where we link out to the project homepage (`url` attribute)

```yaml
projects:
- title: MyFAIR
  subtitle: FAIR data Galaxy integration
  modal-id: 1
  image: fairdata.png
  thumbnail: fairdata_thumbnail.png
  keywords: Galaxy, FAIR data, Web Development
  url: https://github.com/ErasmusMC-Bioinformatics/myFAIR
  description: Lorem ipsum dolor sit amet, usu cu alterum nominavi lobortis. At duo novum diceret. Tantas apeirian vix et, usu sanctus postulant inciderint ut, populo diceret necessitatibus in vim. Cu eum dicam feugiat noluisse.

```

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

### Contact options

Adds contact sections to bottom of page

```yaml
contact-options:
- header: Visiting Address
  text:
    - line: Faculty Building
    - line: Room Ee15.79
    - line: Wytemaweg 80
    - line: 3015CN Rotterdam
    - line: The Netherlands
  links:
    - description: Route and Parking
      url: https://www.erasmusmc.nl/overerasmusmc/bereikbaarheid/erasmusmc_ziekenhuis/?lang=en
```

#### Credit
Theme based on [Agency bootstrap theme ](https://startbootstrap.com/template-overviews/agency/)
