# ErasmusMC Bioinformatics Landing Page

View live page: https://erasmusmc-bioinformatics.github.io/

## How to edit

Simply edit `_config.yml` to add your content!

add any images to the appropriate subfolder in `./img/`

### Previewing changes locally

install jekyll

```
$ sudo apt-get install ruby-bundler
```

clone this repo and cd into the directory

```
$ git clone https://github.com/ErasmusMC-Bioinformatics/erasmusmc-bioinformatics.github.io.git
$ cd erasmusmc-bioinformatics.github.io
$ bundle install
```

make your changes, and run

```
$ bundle exec jekyll serve
```

to serve the site. Now open `http://localhost:4000` in your browser to preview your changes.

Once you are happy, push changes back to the repo and github will automatically rebuild the site


### Applications

- Add applications to `_applications`.
- Icon names should be from [fontaswesome](http://fontawesome.io/icons/)
- Images go in
- The text is given in HTML format

```html
---
layout: application
title: "Deep- and Machine- Learning"
subtitle: "JUNIPER"
icon: stethoscope
author: "Andrew Stubbs"
date: 2020-01-28 23:45:13 +0100
background: '/img/applications/bg-index.jpg'
---
<p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman's earth, if free men make it, will be truly round: a globe in practice, not in theory.</p> 
<p>A second paragraph goes here.</p>
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
  description:
    - paragraph: MyFAIR Analysis is a web application designed to allow scientists to create FAIR data, and to provide FAIR data analysis such that the “end to end” analysis complies with FAIR data principles. MyFAIR analysis is a python application and graphical user interface (GUI) that uses Galaxy2 for analytical workflows and B2DROP3(EUDAT) for FAIR data storage.  Our proof of concept to test myFAIR analysis uses the genome in a bottle trio-samples available form  galaxy training for genetic variation analysis.
    - image: myfair.png
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

- Team members are listed in `_team`
- Corresponding images should be placed in `/img/team/` and named with the `pic` attribute so `img/team/willem.png` in the following example
- Use square image for the best results

```yaml
---
name: Willem de Koning
pic: willem.png
position: PhD student
email: w.dekoning.1@erasmusmc.nl
github_username: willemdek11 (optional)
linkedin_username: willemdek (optional)
twitter_username: willemdek11 (optional)
facebook_username: willemdek (optional)
instagram_username: willemdek (optional)
---
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
