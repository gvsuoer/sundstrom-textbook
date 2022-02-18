# *Mathematical Reasoning: Writing and Proof, PreTeXt Edition* 

This is not the official version, do not use for your teaching or learning. For the active edition, visit [the GVSU Scholarworks page](https://scholarworks.gvsu.edu/books/24).

## Comparison With Other Versions

This textbook is an adaptation of 
*Mathematical Reasoning: Writing and Proof, Version 3*.
(See [the GVSU Scholarworks page](https://scholarworks.gvsu.edu/books/24/))
Please note that *Version 3* is the authoritative edition of *Mathematical Reasoning: Writing and Proof*.


The *PreTeXt Edition* is largely identical to *Version 3*, with the following major exceptions:
* Numbering of figures, tables, and other elements
  * Many tables, figures, propositions, and other items in this edition have a different number     than they do in *Version 3*. For example, Table 5.1 in *Version 3* appears as Table 5.11 in the *PreTeXt Edition*.
  * The only difference is the numbering. The items appear in the same order, with the same content, for both editions.
  * Chapter and section numbers are not changed, nor are exercise numbers.
* Equation numbering 
  * In the *PreTeXt Edition*, all equations are numbered consecutively throughout the entire book. In contrast, equations in Version 3 are numbered within each new theorem, proof, or activity.
  * For example, Beginning Activity 2 of Section 3.3 includes an equation. It is the first equation in that activity, but the fourth listed in the book. This equation is numbered (4) in the *PreTeXt Edition* and (1) in *Version 3*.
* Hints and Answers
  * In print and PDF copies of *Version 3*, exercises with a hint or answer are indicated by an asterisk. 
  * In PDF copies of the *PreTeXt Edition*, exercises with a hint or answer are indicated by an [h] or [a], respectively.
  * In the web version of this edition, the hint or answer can be revealed directly below the exercise.
* Content Updates
  * This edition matches the content in *Version 3* as of July 23, 2021. Later content updates are not included.

## About This Edition

*Mathematical Reasoning: Writing and Proof (PreTeXt Edition)* was developed as part of the [Accelerating Open Educational Resources Initiative](https://www.gvsu.edu/library/sc/AcceleratingOER) at Grand Valley State University, with support from the University Libraries and the President’s Innovation Fund.

*Mathematical Reasoning: Writing and Proof* was written by Ted Sundstrom, Professor Emeritus of Mathematics at Grand Valley State University. This textbook was converted into PreTeXt by Ian Curtis, Editorial Assistant for the GVSU Libraries, with expert guidance and support from Oscar Levin, Associate Professor, School of Mathematical Sciences, University of Northern Colorado, and David Farmer, American Institute of Mathematics.

This edition is released under a Creative Commons - Attribution - Noncommercial - Sharealike license ([CC-BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/)). This allows users to use, share, and adapt the work as long as they provide attribution to the creator(s), avoid using the work for commercial purposes, and share any adaptation with the same license.

The code used to generate this book can be found in this repository. This includes the PreTeXt XML files, figures, customization files (CSS and XSL), and the output (HTML and PDF). Contributors are encouraged to submit an issue or a pull request with changes, especially regarding accessibility (as mentioned below).

*Mathematical Reasoning: Writing and Proof (PreTeXt Edition)* is an adaptation of *Mathematical Reasoning: Writing and Proof, Version 3*, written by Ted Sundstrom and adapted for PreTeXt by Ian Curtis. Both editions are published by the Grand Valley State University Libraries. Previous versions of this text were published by Pearson Education, Inc.

## Accessibility Statement

The Grand Valley State University Libraries strive to ensure our tools, devices, services, and environments are available to and usable by as many people as possible.

The web version of Mathematical Reasoning: Writing and Proof (PreTeXt Edition) incorporates the following features to support accessibility:
* All content can be navigated by use of a keyboard
* Links, headings, and tables have been designed to work with screen readers
* Many figures and images are described in alt text. Note that some figures are explained fully in the corresponding text.
* Mathematics in PreTeXt are rendered with MathJax so they can be understood by using screen readers and/or other assistive devices.

We have identified some accessibility issues which were beyond the GVSU Libraries’ capacity to address in the course of this adaptation. These present an opportunity for future adaptation or revision by educators with expertise in mathematics pedagogy. Known accessibility issues include: 
*  Some exercises and activities in this text require students to visually interpret diagrams or figures; for example, Venn Diagrams (Chapter 5), arrow diagrams (Chapter 6), and digraphs (Chapter 7). These activities cannot be made accessible through alt text alone, and may need to be redesigned or replaced.
* Some images in this text have alt text which may be insufficient to communicate the relevant concepts. The existing alt text would benefit greatly from expert review.  

We are always looking for how we can make our resources more accessible. If you are having problems accessing this resource, please [contact us by email](mailto:oer@gvsu.edu) to let us know.

## Compilation Instructions

To edit the files used to compile this book, we recommend [following the instructions](http://math.oscarlevin.com/2021/07/13/new-pretext-tutorial.html) from Oscar Levin, University of Northern Colorado.

Essentially, you will need a text editor, such as Visual Studio Code, Python, and LaTeX. After properly installing the necessary software, you may use the command line to install the PreTeXt-CLI through `pip install pretextbook`. Then familarize yourself with PreTeXt with

```
pretext new book
```

You may clone this repository by clicking on the green "Code" button above and copying the `HTTPS` url. Then,

```
git clone <HTTPS-url-you-just-copied>
cd sundstrom-textbook
```

Edit the files you would like to, then submit a pull request. Alternatively, you can submit an issue (the issues tab at the top of this page) so we and other developers may address it.