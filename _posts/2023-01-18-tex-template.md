---
title: A ChatGPT-Coauthored LaTeX Template
date: 2023-01-18 
permalink: /blog/tex-template/
layout: post
author: Ali Hariri
read-time: 5-minute
excerpt: "As I was writing a research paper during my PhD, my urge to procrastinate kicked in, and I thought: huh, I can save ten precious minutes upon resubmitting papers if I automate the paper formatting and style. So I spent the three subsequent days creating a LaTeX template"
---

If you work in research, you know that paper rejection is inevitable at some point or another.
But you shake it off and resubmit your work to another conference or journal.
This requires reformatting the paper for the new conference/journal though, which is hectic sometimes.

As I was writing a research paper during my PhD, my urge to procrastinate kicked in, and I thought: huh, I can save ten precious minutes upon resubmitting papers if I automate the paper formatting and style.
So I spent the three subsequent days creating a LaTeX template that automates formatting, eliminating the need to write style-specific code and easing the switching between typical computer science paper formats.
I am not an expert in LaTeX though, so I got help from ChatGPT, who coauthored the template with me 🤖.
The template supports the three typical computer science formats: IEEE, LLNCS as well as ACM, and is available on my [GitHub](https://github.com/HaririAli/cs-paper-template) and [GitLab](https://gitlab.com/Hariri-Ali/tex/cs-paper-template).

<div class="image-container">
    <img src="/images/tex-template/chatgpt.jpg"/>
</div>

### Template Structure
* [main.tex](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/blob/main/main.tex): the root document of the template. This file *must not* be modified.
* [bibliography](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/tree/main/bibliography): contains bibliography styles and references file. *Only the references file* shall be modified.
* [config](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/tree/main/config): contains style-specific code and configurations. The contents of this directory *must not* be modified.
* [sections](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/tree/main/sections): directory to add content, sections and text of the paper.
* [user](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/tree/main/user): contains user-defined variables and configurations such as paper format, topmatter, preamble and packages.

### How to use the template
As a user of the template, you only need to modify/add code and text in the [user](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/tree/main/user), [sections](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/tree/main/sections), and [bibliography](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/tree/main/bibliography) directories.
Add your text in tex files under the [sections](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/tree/main/sections) directory.
It is recommended to write each section in a separate tex file for organisation, but the template works perfectly fine if you write all content in one file only.
You also need to set the template settings in the [user/settings.tex](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/blob/main/user/settings.tex) file.
This is where you set the format (i.e., ACM, IEEE or LLNCS) as well as the sections to be included from the [sections](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/tree/main/sections) directory. 
Note that the sections must be added in the same order you want them to appear.
Other optional settings can also be set in this file.
You can switch between the three formats by modifying a single variable only, and the LaTeX code takes care of the rest.

Example:
```latex
{% raw %}
\def \varStyle{llncs}
\def \varSections{introduction,conclusion}
{% endraw %}
```

Use the [user/topmatter.tex](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/blob/main/user/topmatter.tex) file to set the title, authors, abstract, and keywords using the custom commands defined by the template. Note that author affiliations are passed in the second argument as numbers referring to the positions of institutions as defined below.


Example:
```latex
{% raw %}
\addTitle{insert title here}
\addAuthor{Author}{1}
\addInstitution{Department, Institution}{City}{Country}{{name.surname}@example.com}
\addAbstract{insert abstract here}
\addKeywords{insert, comma-separated, keywords, here}
{% endraw %}
```


You can also use [user/packages.tex](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/blob/main/user/packages.tex) and [user/preamble.tex](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/blob/main/user/preamble.tex) to add packages and user-defined preabmle code (e.g., listings, acronyms) respectively.
Finally, use [bibliography/references.bib](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/blob/main/bibliography/references.bib) for your bibliography.

The user-defined contents of these files are automatically combined in the template, and formatted according to the format you set in the settings file.
They will also be reformatted automatically when you change the format variable.

Give it a try and feel free to contribute :D

### How the template works
Predefined formats such as ACM, IEEE and LLNCS usually define their own LaTeX commands to specify the paper topmatter, which refers to the title, abstract, keywords, as well as the authors and their affiliations.
The template automates formatting by providing its own custom topmatter commands whose definitions are set based on the style variable.
So for example if the style variable is set to LLNCS, the definitions of the custom topmatter commands will call the corresponding commands in LLNCS.
When the style is changed to IEEE, the template will use different definitions of the custom topmatter commands, which call the corresponding commands in IEEE.
The custom commands are defined in the three tex files in the [config](https://gitlab.com/Hariri-Ali/tex/cs-paper-template/-/tree/main/config) directory, where each file corresponds to one of the three formats.
Note that template users are not supposed to modify or add code to these files.
I might explain the contents of these files in more detail one day (in the next ten years maybe).